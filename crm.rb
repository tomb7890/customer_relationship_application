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
      @rolodex.add d[:first_name], d[:last_name], d[:email], d[:note] 
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
    user_selected = 0
    while user_selected != 6  
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts "[0] Display a contact" 
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute"
    puts "[6] Exit"
    puts "Enter a number: "
  end

  def print_attribute_menu 
    puts "[1] First name"
    puts "[2] Last name" 
    puts "[3] Email"
    puts "[4] Note"
    puts "Enter a number, or 0 (zero) to cancel. "
  end

  def call_option(user_selected)
    display_a_contact if user_selected == 0 
    add_new_contact if user_selected == 1
    modify_existing_contact if user_selected == 2
    delete_a_contact if user_selected == 3 
    display_all_contacts if user_selected == 4 
    display_an_attribute if user_selected == 5 
    exit if user_selected == 6 
  end

  def display_all_contacts
    puts @rolodex.display_all_contacts
  end

  def display_a_contact
    puts "Please enter a contact ID."
    id = gets.chomp.to_i
    puts @rolodex.display_particular_contact(id)
  end

  def self.run(name)
    crm = CRM.new(name)
    crm.main_menu
  end

  def get_contact_info_from_user
    userdata = []
    puts "Please enter first name for new contact." 
    first = gets.chomp()
    puts "Please enter last name" 
    last = gets.chomp()
    puts "Please enter email for new contact."
    email = gets.chomp()
    puts "Please enter notes for your new contact. "
    notes = gets.chomp()
    userdata.push(first)
    userdata.push(last)
    userdata.push(email)
    userdata.push(notes)
  end

  def add_new_contact
    userdata = get_contact_info_from_user
    contact = @rolodex.add(userdata[0], userdata[1], userdata[2], userdata[3])
  end

  def get_user_id 
    puts "Please enter an id for a contact to modify." 
    id=gets.chomp.to_i
    puts "Modify user #{id}? (Y/N)"
    confirm = gets.chomp
    if confirm[0] == 'Y' or confirm[0] == 'y' then
      return id
    end 
  end

  def modify_existing_contact
    id = get_user_id 
    if id then 
      contact = @rolodex.find(id)

      @rolodex.display_particular_contact(id)
      puts "\n\n" 
      userdata = print_attribute_menu
      attribute_no = gets.chomp.to_i

      msg = ""
      case attribute_no
      when 1
        msg = "first_name"
      when 2
        msg = "last_name"
      when 3
        msg = "email"
      when 4
        msg = "note"
      end

      puts "Please enter an updated value for #{msg}"
      val = gets.chomp

      @rolodex.set_attrib_value(id, msg, val)
      @rolodex.display_particular_contact(id)
    end
  end 

  def display_an_attribute
    puts "Please enter an attribute"
    key = gets.chomp
    puts "Please enter a value"
    val = gets.chomp
    keysym = key.to_sym
    puts @rolodex.display_info_by_attribute(key, val)
  end
end

CRM.run("boo")
