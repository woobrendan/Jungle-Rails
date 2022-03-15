class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 3 }, presence: true
  validates :email, uniqueness: { case_sensitive: false }, presence: true

  def self.authenticate_with_credentials(email, password)
    # binding.pry
    alteredEmail = email.strip.downcase
    user = User.find_by_email(alteredEmail)
    if user && user.authenticate(password)  
      user
    else
      nil
    end
  end

end
