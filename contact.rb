class Contact < ActiveRecord::Base
  def to_s
    str = <<-HERE
    First name: #{first_name}
    Last name: #{last_name}
    Email: #{email}
    Notes: #{notes}
    I.D.: #{id}
    HERE
    str
  end
end
