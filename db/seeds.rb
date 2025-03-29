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
puts "🌱 Seeding Services..."

Service.find_or_create_by!(slug: "study-group") do |service|
  service.title = "Study Group"
  service.description = "Engage in discussions on the works of Joanna de Ângelis for self-discovery and transformation."
  service.icon = "fa-solid fa-book-open"
  service.color = "#a3c9f1"
end

Service.find_or_create_by!(slug: "energy-healing") do |service|
  service.title = "Energy Healing"
  service.description = "Experience spiritual renewal and balance through the laying on of hands."
  service.icon = "fa-solid fa-star-and-crescent"
  service.color = "#dcd6f7"
end

Service.find_or_create_by!(slug: "childrens-and-youth-group") do |service|
  service.title = "Children’s and Youth Group"
  service.description = "A space for young people to learn Spiritist values through engaging activities."
  service.icon = "fa-solid fa-children"
  service.color = "#fbc4ab"
end

Service.find_or_create_by!(slug: "lecture") do |service|
  service.title = "Lecture"
  service.description = "Attend lectures that explore Spiritist philosophy and its applications in daily life."
  service.icon = "fa-solid fa-microphone"
  service.color = "#ffeaa7"
end

Service.find_or_create_by!(slug: "library") do |service|
  service.title = "Library"
  service.description = "Explore our collection of Spiritist books and resources."
  service.icon = "fa-solid fa-book"
  service.color = "#ffeaa7"
end

Service.find_or_create_by!(slug: "fraternal-assistance") do |service|
  service.title = "Fraternal Assistance"
  service.description = "Receive emotional and spiritual support through private conversations."
  service.icon = "fa-solid fa-hand-holding-heart"
  service.color = "#f8c291"
end

Service.find_or_create_by!(slug: "gospel-at-home") do |service|
  service.title = "Gospel at Home - Spiritual Support"
  service.description = "Spiritual support held at home, offered by appointment."
  service.icon = "fa-solid fa-house"
  service.color = "#cdeac0"
end

puts "✅ Services seeded successfully!"

# Seed events
CentreEvent.destroy_all

CentreEvent.create!([
  {
    title: "Intro to Spiritism",
    date: "Thursday, April 10, 2025 – 7:00 PM",
    description: "An open session to introduce newcomers to Spiritist teachings. All are welcome.",
    location: "Spiritist Centre, 38 Palmerston Rd, Unley SA",
    icon: "fa-solid fa-calendar-days"
  },
  {
    title: "Mediumship Development Workshop",
    date: "Saturday, May 3, 2025 – 10:00 AM to 2:00 PM",
    description: "A guided workshop focused on mediumship practices and ethical development.",
    location: "Spiritist Centre, 38 Palmerston Rd, Unley SA",
    icon: "fa-solid fa-hands-asl-interpreting"
  }
])

puts "✅ Events seeded successfully!"
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?