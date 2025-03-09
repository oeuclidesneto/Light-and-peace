require 'csv'

csv_file = Rails.root.join('db', 'speeches.csv')

CSV.foreach(csv_file, headers: true) do |row|
  Speech.create(
    theme: row['Theme'],
    speaker: row['Speaker'],
    date: DateTime.parse(row['Date'])
  )
end

puts "✅ Speeches imported successfully!"
