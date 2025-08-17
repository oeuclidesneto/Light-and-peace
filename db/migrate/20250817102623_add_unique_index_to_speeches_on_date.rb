class AddUniqueIndexToSpeechesOnDate < ActiveRecord::Migration[7.0]
  def change
    # Remove duplicates first (if any exist)
    duplicates = execute <<-SQL.squish
      SELECT date, COUNT(*)
      FROM speeches
      GROUP BY date
      HAVING COUNT(*) > 1
    SQL

    duplicates.each do |row|
      date = row["date"]
      Speech.where(date: date).offset(1).destroy_all
    end

    # Add the unique index
    add_index :speeches, :date, unique: true
  end
end
