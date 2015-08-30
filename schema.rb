require_relative "connection"

# define a database schema
ActiveRecord::Schema.define do

  create_table :contacts, force: :cascade do |t|
    t.string :first_name
    t.string :last_name
    t.string :email
    t.text :notes
    t.datetime :created_at, null: false
    t.datetime :updated_at, null: false
  end

end


