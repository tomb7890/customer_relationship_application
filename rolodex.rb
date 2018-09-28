require_relative 'contact'

class Rolodex
  def size
    @contacts.length
  end

  def add(f, l, e, n )
    Contact.create(first_name: f, last_name: l, email: e, notes: n )
  end

  def modify_contact(id, attrib_no, attrib_val)
    begin 
      contact = Contact.find(id)
      contact.first_name = attrib_val if attrib_no == Contact::Attribs::FIRST_NAME
      contact.last_name = attrib_val if attrib_no == Contact::Attribs::LAST_NAME
      contact.email = attrib_val if attrib_no == Contact::Attribs::EMAIL
      contact.notes = attrib_val if attrib_no == Contact::Attribs::NOTES
      contact.save
    rescue ActiveRecord::RecordNotFound
      "Contact not found. Please check i.d."
    end
  end

  def display_all_contacts
    all_contacts=Contact.all
    s=[]
    if all_contacts.empty?
      s << "Rolodex is empty"
    else
      all_contacts.each do |c|
        s << c.display
      end
    end
    s
  end

  def display_particular_contact id
    s = ''
    begin
      contact = Contact.find(id)
      s = contact.display
    rescue ActiveRecord::RecordNotFound
      s = "Record #{id} not found"
    end
    s
  end

  def display_info_by_attribute(keysym, val)
    begin 
      s = ''
      results = Contact.all.select { |c| val == c.send(keysym) }
      results.each do |r|
        s = s +  r.to_s + "\n"
      end
      s = "\n\n\n"
    rescue NoMethodError
      s = "There was an error looking up #{keysym}."
    end
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
