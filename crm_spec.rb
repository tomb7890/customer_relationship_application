require_relative "contact"
require_relative "rolodex"

describe "Salestax Addl"  do  

testdata = [
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


  it "should verify basic testing" do
    expect("5 5").to eql "5 5"
  end
  
  it "should initialize the application" do 
    r= Rolodex.new
    testdata.each do |d|
      r.add d[:first_name], d[:last_name], d[:email], d[:note] 
    end
  end

  it "should display_all_contacts" do 
    r= Rolodex.new
    testdata.each do |d|
      r.add d[:first_name], d[:last_name], d[:email], d[:note] 
    end

    puts r.display_all_contacts
  end

  
end



