require 'csv'

# Import speeches from CSV
csv_file = Rails.root.join('db', 'speeches.csv')

CSV.foreach(csv_file, headers: true) do |row|
  Speech.create!(
    theme: row['Theme'],
    speaker: row['Speaker'],
    date: DateTime.parse(row['Date'])
  )
end

puts "✅ Speeches imported successfully!"

# Seed services
Service.create!([
  { title: "Study Group", description: "Engage in discussions on the works of Joanna de Ângelis for self-discovery and transformation." },
  { title: "Energy Healing", description: "Experience spiritual renewal and balance through the laying on of hands." },
  { title: "Children’s and Youth Group", description: "A space for young people to learn Spiritist values through engaging activities." },
  { title: "Lecture", description: "Attend lectures that explore Spiritist philosophy and its applications in daily life." },
  { title: "Library", description: "Explore our collection of Spiritist books and resources." },
  { title: "Fraternal Assistance", description: "Receive emotional and spiritual support through private conversations." },
  { title: "Gospel at Home - Spiritual Support", description: "Spiritual support held at home, offered by appointment."
}

])

puts "✅ Services seeded successfully!"
