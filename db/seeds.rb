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

Book.destroy_all

Book.create!([
  {
    position: 1,
    current: false,
    title: "Jesus e Atualidade",
    subtitle: "Jesus and Modernity",
    description: "The relevance of Jesus' thought continues to surprise even the most skeptical scholars of human problems..."
  },
  {
    position: 2,
    current: true,
    title: "O Homem Integral",
    subtitle: "The Integral Man",
    description: "In this extraordinary essay, Joanna de Ângelis analyzes all the philosophical and psychological aspects..."
  },
  {
    position: 3,
    current: false,
    title: "Plenitude",
    subtitle: "Plenitude",
    description: "The spiritual author makes a profound psychological analysis of aspects of suffering..."
  },
  {
    position: 4,
    current: false,
    title: "Momentos de Saúde e de Consciência",
    subtitle: "Moments of Health and Consciousness",
    description: "The conquest of integral health is the goal desired by the human creature..."
  },
  {
    position: 5,
    current: false,
    title: "O Ser Consciente",
    subtitle: "The Conscious Being",
    description: "This modest book intends to help in the conquest of consciousness. It studies human problems in light of the Fourth Force in Psychology..."
  },
  {
    position: 6,
    current: false,
    title: "Autodescobrimento",
    subtitle: "Self-Discovery",
    description: "We try to build bridges between Humanist and Transpersonal Psychologies with the Spiritist Doctrine..."
  },
  {
    position: 7,
    current: false,
    title: "Desperte e Seja Feliz",
    subtitle: "Awaken and Be Happy",
    description: "Contemporary men and women, seduced by ambitions of power and pleasure, remain asleep to spiritual responsibilities..."
  },
  {
    position: 8,
    current: false,
    title: "Vida: Desafios e Soluções",
    subtitle: "Life: Challenges and Solutions",
    description: "Studies of human problems in the light of Spiritist and Transpersonal Psychology to prepare the Spirit for its future destination."
  },
  {
    position: 9,
    current: false,
    title: "Amor, Imbatível Amor",
    subtitle: "Love, Unbeatable Love",
    description: "Examines various psychopathologies and conflicts, building a spiritual bridge to Love as the ultimate healing force."
  },
  {
    position: 10,
    current: false,
    title: "O Despertar do Espírito",
    subtitle: "The Awakening of the Spirit",
    description: "A deep study of the existential being across reincarnations and the awakening to spiritual awareness."
  },
  {
    position: 11,
    current: false,
    title: "Jesus e o Evangelho",
    subtitle: "Jesus and the Gospel",
    description: "A depth psychology study of Jesus’ life and message, psychographed by Divaldo Franco."
  },
  {
    position: 12,
    current: false,
    title: "Triunfo Pessoal",
    subtitle: "Personal Triumph",
    description: "Shows how every disorder or suffering stems from the Spirit’s internal state, with lessons drawn from Jungian and Spiritist perspectives."
  },
  {
    position: 13,
    current: false,
    title: "Conflitos Existenciais",
    subtitle: "Existential Conflicts",
    description: "Analyzes modern psychological conflicts under the lens of the Spiritist Doctrine."
  },
  {
    position: 14,
    current: false,
    title: "Encontro com a Paz e a Saúde",
    subtitle: "Meeting with Peace and Health",
    description: "Explores feelings and inner transformations using Transpersonal Psychology and Spiritist principles."
  },
  {
    position: 15,
    current: false,
    title: "Em Busca da Verdade",
    subtitle: "In Search of Truth",
    description: "Guides the reader toward psychological maturity and spiritual evolution through deep inner work."
  },
  {
    position: 16,
    current: false,
    title: "Psicologia da Gratidão",
    subtitle: "Psychology of Gratitude",
    description: "Gratitude becomes a tool for psychological and spiritual health — especially in a world of moral indifference."
  }
])

puts "📚 Books seeded successfully!"

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

AdminUser.find_or_create_by!(email: 'admin@example.com') do |admin|
  admin.password = 'password'
  admin.password_confirmation = 'password'
end if Rails.env.development?
