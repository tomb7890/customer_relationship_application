require_relative "contact"
require_relative "rolodex"

class CRM

  def initialize(name)
  @rolodex = Rolodex.new
    data = [

            {
              first_name: "Frederick",
              last_name: "Flintstone",
              email: "fredflintstone@paleo.org",
              note: "Willlllllllllllllllllllllllllmaaaaaaaaaaaaaaaaaaaaaaaaa!!!!!!!."
            },

            {
              first_name: "Barney",
              last_name: "Rubble",
              email: "b.rubble@paleo.org",
              note: "stuff"
            },

            {
              first_name: "F. Ross",
              last_name: "Johnson",
              email: "rossjohnson@hotmail.com",
              note: "Such a cool dude."
            },
            {
              first_name: "Adrian",
              last_name: "Carton de Wiart",
              email: "adrianwiart@gmail.com",
              note: "Even cooler."
            }
           ]

    
    data.each do |d|
      @rolodex.add(d =>first_name, d =>last_name, d=>email, d=>note)
    end
  end

# a getter (*get* the value of an attribute)
  def email
    @email
  end

  # a setter (*set* the value of an attribute)
  def note(note)
    @note = note
  end

  def main_menu
    puts "main_menu"
    print_main_menu
    user_selected = gets.to_i
    call_option(user_selected)
  end

  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute"
    puts "[6] Exit"
    puts "Enter a number: "
  end

  def call_option(user_selected)
    add_new_contact if user_selected == 1
    modify_existing_contact if user_selected == 2
    delete_a_contact if user_selected == 3 
    display_all_contacts if user_selected == 4 
    display_an_attribute if user_selected == 5 
    exit if user_selected == 6 
  end

  def self.run(name)
    crm = CRM.new(name)
    crm.main_menu
  end

  def get_contact_info_from_user
    puts "Please enter first name for new contact." 
    first = gets.chomp()
    puts "Please enter last name" 
    last = gets.chomp()
    puts "Please enter email for new contact."
    email = gets.chomp()
    puts "Please enter notes for your new contact. "
    notes = gets.chomp()
  end 

  def add_new_contact
    print "Enter First Name: "
    first_name = gets.chomp
    print "Enter Last Name: "
    last_name = gets.chomp
    print "Enter Email Address: "
    email = gets.chomp
    print "Enter a Note: "
    note = gets.chomp
    contact = Contact.new(first_name, last_name, email, note)
  end

  def get_user_id 
    puts "Please enter an id for a contact to modify." 
    id=gets.chomp.to_i
    puts "Modify user #{id}? (Y/N)"
    confirm = gets.chomp
    if confirm[0] == 'Y' or confirm[0] == 'y' then
      return id
      return nil
    end 
  end

  def modify_existing_contact
    id = get_user_id 
    if id then 
      contact = @contacts[id]
      get_contact_info_from_user
      @rolodex.modify_contact(id, first_name, last_name, email, note)
    end
  end 

end

CRM.run("boo")
