class Contact < ActiveRecord::Base

  module Attribs
    FIRST_NAME = 1
    LAST_NAME = 2
    EMAIL = 3
    NOTES = 4
  end

  def to_s
    "#{first_name} #{last_name} #{email} #{notes} #{id}"
  end

  def display
    str = <<-HERE
    First name: #{first_name}
    Last name: #{last_name}
    Email: #{email}
    Notes: #{notes}
    I.D.: #{id}
    HERE
    str
  end
end
