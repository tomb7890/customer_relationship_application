require_relative 'connection'
require_relative 'contact'
require 'faker'

def clean_database
  Contact.delete_all
end

def seed_database
  5.times do
    Contact.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      notes: Faker::Company.bs
    )
  end
end
