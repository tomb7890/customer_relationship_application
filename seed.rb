require_relative "connection"
require_relative "contact"
require "faker"

# Seed data
Contact.delete_all
5.times do
  Contact.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    notes: Faker::Lorem.paragraph
    )
end
