class Rolodex

  def initialize
    @contacts = []
    @id = 1000
  end
  
  def contacts
    @contacts
  end
  
  def add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end
  
  def add(first_name, last_name, email, note)
    @id += 1
    c = Contact.new(@id, first_name, last_name, email, note)
    @contacts << c 
  end
  
  def modify_contact (id, first_name, last_name, email, note)
    
  end
  
  def display_all_contacts
    s = ""
    @contacts.each do | c | 
      s = s + c.display + "\n"
    end 
    s
  end
  
  def display_particular_contact
    # 
  end
  
  def display_info_by_attribute(key)
    
  end
  
  def delete_contact
    # 
  end
  
end

