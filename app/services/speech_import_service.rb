class SpeechImportService
  class ImportError < StandardError; end

  REQUIRED_HEADERS = %w[data palestrante tema].freeze
  IGNORED_SHEET_NAME = "palestrantes nao deletar"

  SUPPORTED_DATE_FORMATS = [
    "%d/%m/%Y",
    "%Y-%m-%d",
    "%d-%m-%Y",
    "%Y/%m/%d"
  ].freeze

  def initialize(file)
    @file = file
  end

  def call
    workbook = Roo::Excelx.new(file.path)
    sheet_name, header_row = find_schedule_sheet(workbook)

    unless sheet_name
      raise ImportError,
            "No valid speech schedule sheet was found. Required columns: Data, Palestrante and Tema."
    end

    rows = extract_rows(workbook.sheet(sheet_name), header_row)

    created = 0
    updated = 0
    unchanged = 0

    Speech.transaction do
      rows.each do |row|
        speech_date = Time.zone.local(
          row[:date].year,
          row[:date].month,
          row[:date].day
        )

        speech = Speech.where(date: speech_date.all_day).first_or_initialize
        was_new = speech.new_record?

        speech.assign_attributes(
          date: speech_date,
          speaker: row[:speaker],
          theme: row[:theme]
        )

        if was_new
          speech.save!
          created += 1
        elsif speech.changed?
          speech.save!
          updated += 1
        else
          unchanged += 1
        end
      end
    end

    {
      sheet: sheet_name,
      created: created,
      updated: updated,
      unchanged: unchanged,
      total: rows.count
    }
  rescue Roo::FileNotFound, Zip::Error
    raise ImportError, "The uploaded file could not be opened as a valid XLSX spreadsheet."
  rescue ActiveRecord::RecordInvalid => error
    raise ImportError, error.record.errors.full_messages.to_sentence
  end

  private

  attr_reader :file

  def extract_rows(sheet, header_row)
  headers = sheet.row(header_row).map { |value| normalize(value) }

  date_index = headers.index("data")
  speaker_index = headers.index("palestrante")
  theme_index = headers.index("tema")

  rows = []
  imported_dates = {}

  ((header_row + 1)..sheet.last_row).each do |row_number|
    row = sheet.row(row_number)

    raw_date = row[date_index]
    raw_speaker = row[speaker_index]
    raw_theme = row[theme_index]

    # The first completely blank row marks the end of the schedule.
    break if [raw_date, raw_speaker, raw_theme].all?(&:blank?)

    if raw_date.blank?
      raise ImportError, "Row #{row_number}: date is required."
    end

    date = parse_date(raw_date, row_number)

    if imported_dates.key?(date)
      previous_row = imported_dates[date]

      raise ImportError,
            "Rows #{previous_row} and #{row_number}: duplicate date #{date.strftime('%d/%m/%Y')}."
    end

    imported_dates[date] = row_number

    rows << {
      date: date,
      speaker: raw_speaker.to_s.strip.presence,
      theme: raw_theme.to_s.strip.presence
    }
  end

  rows
end

  def parse_date(value, row_number)
    date =
      case value
      when DateTime, Time
        value.to_date
      when Date
        value
      else
        parse_string_date(value.to_s.strip)
      end

    unless date
      raise ImportError,
            "Row #{row_number}: invalid date #{value.inspect}."
    end

    unless date.monday?
      raise ImportError,
            "Row #{row_number}: #{date.strftime('%d/%m/%Y')} must be a Monday."
    end

    date
  end

  def parse_string_date(value)
    SUPPORTED_DATE_FORMATS.each do |format|
      return Date.strptime(value, format)
    rescue ArgumentError
      next
    end

    nil
  end

  def find_schedule_sheet(workbook)
    workbook.sheets.each do |sheet_name|
      next if normalize(sheet_name) == IGNORED_SHEET_NAME

      sheet = workbook.sheet(sheet_name)
      rows_to_check = [sheet.last_row.to_i, 10].min

      1.upto(rows_to_check) do |row_number|
        headers = sheet.row(row_number).map { |value| normalize(value) }

        if REQUIRED_HEADERS.all? { |header| headers.include?(header) }
          return [sheet_name, row_number]
        end
      end
    end

    nil
  end

  def normalize(value)
    I18n.transliterate(value.to_s)
        .downcase
        .strip
        .gsub(/[^a-z0-9]+/, " ")
        .strip
  end
end
