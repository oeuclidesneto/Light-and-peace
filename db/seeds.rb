# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Service.create([
  { name: "Meditation Sessions", description: "Join guided meditation sessions to improve your mindfulness." },
  { name: "Healing Circles", description: "Connect with a supportive community for emotional and spiritual healing." },
  { name: "Spiritual Counseling", description: "One-on-one sessions with experienced spiritual mentors." }
])
