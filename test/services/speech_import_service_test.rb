require "test_helper"
require "tempfile"
require "caxlsx"

class SpeechImportServiceTest < ActiveSupport::TestCase
  setup do
    Speech.delete_all
  end

  test "creates new speeches from a valid spreadsheet" do
    file = build_spreadsheet([
      ["Data", "Palestrante", "Tema", "Referências"],
      [Date.new(2027, 2, 1), "João", "Theme 1", "Ignored"],
      [Date.new(2027, 2, 8), "Maria", "Theme 2", "Ignored"]
    ])

    result = SpeechImportService.new(file).call

    assert_equal 2, result[:created]
    assert_equal 0, result[:updated]
    assert_equal 0, result[:unchanged]
    assert_equal 2, result[:total]
    assert_equal 2, Speech.count

    first_speech = Speech.order(:date).first

    assert_equal "João", first_speech.speaker
    assert_equal "Theme 1", first_speech.theme
  ensure
    file&.close!
  end

  test "updates an existing speech with the same date" do
    existing_date = Time.zone.local(2027, 2, 1)

    Speech.create!(
      date: existing_date,
      speaker: "Old speaker",
      theme: "Old theme"
    )

    file = build_spreadsheet([
      ["Data", "Palestrante", "Tema"],
      [Date.new(2027, 2, 1), "New speaker", "New theme"]
    ])

    result = SpeechImportService.new(file).call

    assert_equal 0, result[:created]
    assert_equal 1, result[:updated]
    assert_equal 1, Speech.count

    speech = Speech.first

    assert_equal "New speaker", speech.speaker
    assert_equal "New theme", speech.theme
  ensure
    file&.close!
  end

  test "keeps blank speaker and theme values" do
    file = build_spreadsheet([
      ["Data", "Palestrante", "Tema"],
      [Date.new(2027, 2, 1), nil, nil]
    ])

    result = SpeechImportService.new(file).call

    assert_equal 1, result[:created]

    speech = Speech.first

    assert_nil speech.speaker
    assert_nil speech.theme
  ensure
    file&.close!
  end

  test "rejects a date that is not a Monday" do
    file = build_spreadsheet([
      ["Data", "Palestrante", "Tema"],
      [Date.new(2027, 2, 2), "João", "Invalid date"]
    ])

    error = assert_raises(SpeechImportService::ImportError) do
      SpeechImportService.new(file).call
    end

    assert_match "must be a Monday", error.message
    assert_equal 0, Speech.count
  ensure
    file&.close!
  end

  test "rejects duplicate dates and imports nothing" do
    file = build_spreadsheet([
      ["Data", "Palestrante", "Tema"],
      [Date.new(2027, 2, 1), "João", "Theme 1"],
      [Date.new(2027, 2, 1), "Maria", "Theme 2"]
    ])

    error = assert_raises(SpeechImportService::ImportError) do
      SpeechImportService.new(file).call
    end

    assert_match "duplicate date", error.message
    assert_equal 0, Speech.count
  ensure
    file&.close!
  end

  test "does not delete speeches missing from the spreadsheet" do
    Speech.create!(
      date: Time.zone.local(2027, 2, 15),
      speaker: "Existing speaker",
      theme: "Existing theme"
    )

    file = build_spreadsheet([
      ["Data", "Palestrante", "Tema"],
      [Date.new(2027, 2, 1), "João", "Theme 1"]
    ])

    SpeechImportService.new(file).call

    assert_equal 2, Speech.count
    assert Speech.exists?(date: Time.zone.local(2027, 2, 15))
  ensure
    file&.close!
  end

  private

  def build_spreadsheet(rows)
    file = Tempfile.new(["speech_schedule", ".xlsx"])

    package = Axlsx::Package.new
    workbook = package.workbook

    workbook.add_worksheet(name: "Palestrantes (nao deletar)") do |sheet|
      sheet.add_row ["Ignored sheet"]
    end

    workbook.add_worksheet(name: "Preleções 2027") do |sheet|
      rows.each { |row| sheet.add_row row }
    end

    package.serialize(file.path)
    file
  end
end
