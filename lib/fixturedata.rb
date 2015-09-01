#!/usr/bin/env ruby

require "yaml"
require "sqlite3"
require_relative "../connection"
require_relative "../rolodex"

elements = YAML::load(File.open('test/fixtures/contacts.yml'))
elements.each do |el|
  hsh = el[1]

  f = hsh["first_name"]
  l = hsh["last_name"]
  em = hsh["email"]
  n = hsh["notes"]

  Contact.create!(first_name: f, last_name: l, email: em, notes: n)
end
