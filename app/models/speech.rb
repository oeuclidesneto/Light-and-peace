class Speech < ApplicationRecord
  validates :date, presence: true, uniqueness: true

  validate :date_must_be_monday

  def self.next_visible
    cutoff_time = Time.current.in_time_zone('Adelaide').change(hour: 20) # 8PM Adelaide time

    if Time.current < cutoff_time
      where("date >= ?", Time.current.in_time_zone('Adelaide').beginning_of_day)
    else
      where("date > ?", cutoff_time)
    end.order(:date)
  end

  def self.ransackable_attributes(auth_object = nil)
  %w[created_at date id speaker theme updated_at]
  end

  private

  def date_must_be_monday
    return if date.blank?

    unless date.in_time_zone('Adelaide').monday?
      errors.add(:date, "must be a Monday")
    end
  end
end
