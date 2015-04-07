require_relative "contact"
require_relative "rolodex"

describe "CRM tests"  do  

  before(:all) do

    @testdata = [
                {
                  first_name: "Frederick",
                  last_name: "Flintstone",
                  email: "fredflintstone@paleo.org",
                  note: "Wilmaaaaaaaaaaaa!!!!!!!"
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
                  first_name: "David S.",
                  last_name: "Johnson",
                  email: "david.s.johnson@gmail.com",
                  note: "Foo bar baz."
                },
                
                {
                  first_name: "Frederick",
                  last_name: "Carton de Wiart",
                  email: "adrianwiart@gmail.com",
                  note: "Even cooler."
                }
               ]
    
    @r= Rolodex.new
    @testdata.each do |d|
      @r.add d[:first_name], d[:last_name], d[:email], d[:note] 
    end

  end

  it "should verify basic testing" do
    expect("5 5").to eql "5 5"
  end
  
  it "should initialize the application" do 
    @r
  end

  it "should display_all_contacts" do 
    stuff= @r.display_all_contacts
    expected = @testdata.length 
    actual = stuff.count("\n")
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



