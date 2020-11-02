# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Event.destroy_all
Participation.destroy_all


require 'faker'

users = []
events = []
participations = []

30.times do 
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(word_count: 10), email: Faker::Internet.email)
  users << user
end

20.times do 
  event = Event.create(start_date: Faker::Time.forward(days: 100, format: :long), title: Faker::Games::Pokemon.name, description: Faker::Quote.famous_last_words, price: Faker::Number.between(from: 1, to: 1000), location: Faker::Address.city, user: users.sample, duration: (Faker::Number.within(range: 1..50) * 5))
  events << event
end

100.times do
  participation = Participation.create(user: users.sample, event: events.sample)
end