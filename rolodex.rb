require_relative 'contact'

class Rolodex

  def add(f, l, e, n )
    Contact.create(first_name: f, last_name: l, email: e, notes: n )
  end

  def modify_contact(id, attrib_no, attrib_val)
    contact = Contact.find(id)
    contact.first_name = attrib_val if attrib_no == Contact::Attribs::FIRST_NAME
    contact.last_name = attrib_val if attrib_no == Contact::Attribs::LAST_NAME
    contact.email = attrib_val if attrib_no == Contact::Attribs::EMAIL
    contact.notes = attrib_val if attrib_no == Contact::Attribs::NOTES
    contact.save
  rescue ActiveRecord::RecordNotFound
    'Contact not found. Please check i.d.'
  end

  def display_all_contacts
    all_contacts = Contact.all
    s=[]
    if all_contacts.empty?
      s << 'Rolodex is empty'
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
    s = []
    results = Contact.all.select { |c| val == c.send(keysym) }
    results.each do |c2|
      s << c2.to_s
    end
    s
  end

  def set_attrib_value(id, attrib, val)
    c = find(id)
    c.send("#{attrib}=", val)
  end

  def delete_contact id
    record = Contact.find(id)
    record.destroy
  end

  def find(contact_id)
    @contacts.find { |c| contact_id == c.id }
  end

  def size
    Contact.all.size
  end
end
