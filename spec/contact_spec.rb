require_relative "../connection"
require_relative "../rolodex"
require_relative "../crm.rb"

describe Contact do

  describe '#new' do
    it "returns a Contact object" do
      c = Contact.new
      expect(c).to be_a Contact
    end
  end

  describe '#to_s' do
    it "returns the contact's details as a string" do
      c = Contact.last
      expected = c.to_s
      expect(expected).to eq "Frederick Carton de Wiart adrianwiart@gmail.com Even cooler."
    end
  end
end
