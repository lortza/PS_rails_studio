class User < ActiveRecord::Base
  has_many :registrations, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_events, through: :likes, source: :event
  
  has_secure_password #this adds presence validation, confirmation validation

  validates :name, presence: true
  validates :email, presence: true,
    format: /\A\S+@\S+\z/,
    uniqueness: { case_sensitive: false  }

  def gravatar_id
    Digest::MD5::hexdigest(email.downcase)
  end #gravatar_id

  def self.authenticate(email_or_username, password)
    user = User.find_by(email: email_or_username) || User.find_by(username: email_or_username)
    user && user.authenticate(password)
  end #self.authenticate(email, password)
      
end #User
