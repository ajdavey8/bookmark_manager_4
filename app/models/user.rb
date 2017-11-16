require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :password_crypt, Text

  def password=(new_password)
    self.password_crypt= BCrypt::Password.create(new_password)
  end
  
end
