require_relative 'connection'
require_relative 'rolodex'
require_relative 'seed'
require_relative 'schema'

RSpec.configure do |config|
  config.before(:suite) do
    clean_database
    load_schema_file
    seed_database
  end
end

describe 'CRM tests' do
  
  before(:all) do
    @r = Rolodex.new
  end

  it 'should display_all_contacts' do
    actual = @r.display_all_contacts.size
    expected = seed_data_amount
    expect(actual).to eql expected
  end

  it "should display a particular contact" do
    id = 1003
    expected = "F. Ross Johnson rossjohnson@hotmail.com Such a cool dude. 1003"
    d = @r.display_particular_contact(id)
    expect(expected).to eql d 
  end

  it "should delete a particular contact" do 
    id = 1003
    expect(@r.size).to eql 5
    @r.delete_contact(id) 
    expect(@r.size).to eql 4
    
    expected = nil
  it 'should modify a particular contact' do
    updated_value = "aHighlyUnlikelyLastName"
    id = Contact.last.id
    @r.modify_contact(id, Contact::Attribs::LAST_NAME, updated_value)
    expect( Contact.last.last_name).to eql(updated_value)
  end

  it 'should gracefully handle bad ids' do
    updated_value = "yetAnotherHighlyUnlikelyLastName"
    id = -999
    result = @r.modify_contact(id, Contact::Attribs::LAST_NAME, updated_value)
    expect(result).to eql("Contact not found. Please check i.d.")
  end

    d = @r.display_particular_contact(id)
    expect(expected).to eql d
  end	

  it "should find info by attrib " do
    actual = @r.display_info_by_attribute("email", "b.rubble@paleo.org")
    expect(actual.include?("Barney Rubble")).to eql true 
  end  

  it "should display an attribute" do
    key =  "first_name"
    val = "Frederick"
    s = @r.display_info_by_attribute(key, val)

    # There should be two records with the first name Fred 
    n = s.count("\n")
    expect(n).to eql 2 
  end

end



