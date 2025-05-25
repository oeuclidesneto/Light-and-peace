class Speech < ApplicationRecord
  def self.next_visible
    cutoff_time = Time.current.in_time_zone('Adelaide').change(hour: 20) # 8PM Adelaide time
    if Time.current < cutoff_time
      where("date >= ?", Time.current.in_time_zone('Adelaide').beginning_of_day)
    else
      where("date > ?", cutoff_time)
    end.order(:date)
  end
end
