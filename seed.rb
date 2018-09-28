require_relative 'connection'
require_relative 'contact'
require 'faker'

def seed_data_amount
  7
end

def clean_database
  Contact.delete_all
end

def seed_database
  seed_data_amount.times do
    Contact.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      notes: Faker::Company.bs
    )
  end
end
