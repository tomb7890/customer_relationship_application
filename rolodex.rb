require_relative 'contact'

class Rolodex
  def size
    @contacts.length
  end

  def initialize
  end

  def add(f, l, e, n )
    Contact.create(first_name: f, last_name: l, email: e, notes: n )
  end

  def modify_contact(id, attrib_no, attrib_val)
    contact = Contact.find(id)
    if contact
      contact.first_name = attrib_val if attrib_no == 1
      contact.last_name = attrib_val if attrib_no == 2
      contact.email = attrib_val if attrib_no == 3
      contact.note = attrib_val if attrib_no == 4
      contact.save
    else
      puts "Contact not found. Please check i.d."
    end
  end

  def display_all_contacts
    all_contacts=Contact.all
    puts "Rolodex is empty" if all_contacts.empty?
    all_contacts.each do |c|
      puts c.display
    end
  end

  def display_particular_contact id
    begin
      contact = Contact.find(id)
      puts contact.display
    rescue ActiveRecord::RecordNotFound
      puts "Record #{id} not found"
    end
  end

  def display_info_by_attribute(keysym, val)
    # "display_info_by_attribute"
    s = ""
    results = @contacts.select { |c| val == c.send(keysym) }
    results.each do | r |
        s = s +  r.to_s + "\n"
    end
    s
  end

  def set_attrib_value(id, attrib, val)
    c = find(id)
    c.send("#{attrib}=", val)
  end

  def delete_contact id
    begin
      record = Contact.find(id)
      record.destroy
    rescue ActiveRecord::RecordNotFound
      puts "Record #{id} not found"
    end
  end

  def find(contact_id)
    @contacts.find { |c| contact_id == c.id }
  end
end
