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

  it 'should display a particular contact' do
    id = Contact.last.id
    display_string = @r.display_particular_contact(id)
    expect(display_string).to match(/.*first name.*last name.*notes.*/mi)
  end

  it 'should modify a particular contact' do
    updated_value = 'aHighlyUnlikelyLastName'
    id = Contact.last.id
    @r.modify_contact(id, Contact::Attribs::LAST_NAME, updated_value)
    expect( Contact.last.last_name).to eql(updated_value)
  end

  it 'should gracefully handle bad ids' do
    updated_value = 'yetAnotherHighlyUnlikelyLastName'
    id = -999
    result = @r.modify_contact(id, Contact::Attribs::LAST_NAME, updated_value)
    expect(result).to eql('Contact not found. Please check i.d.')
  end

  it 'should delete a particular contact' do
    id = Contact.first.id
    expect(@r.size).to eql seed_data_amount
    @r.delete_contact(id)
    expect(@r.size).to eql seed_data_amount - 1
    expected = "Record #{id} not found"
    d = @r.display_particular_contact(id)
    expect(expected).to eql d
  end

  it 'should display an attribute' do
    aContact = Contact.last
    val = aContact.first_name
    expected = aContact.to_s
    key =  'first_name'
    actual = @r.display_info_by_attribute(key, val)
    expect(expected).to eql (actual.first )
  end

  it 'should raise an error when using bad attribute name' do
    key = 'bogus'
    val = ''
    expect{
      @r.display_info_by_attribute(key, val)
    }.to raise_error(NoMethodError)
  end

  it 'should return an empty array when no matches ' do
    key = 'first_name'
    val = '9999999999999999'
    expect(@r.display_info_by_attribute(key, val)).to eql []
  end
end
