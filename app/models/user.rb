class User < ActiveRecord::Base
  has_many :messages
  has_many :message_flags
  has_many :relations
  validates_presence_of :user_name,:phone_no,:imsi,:ecgi
  validates_format_of :phone_no, :with => /010[0-9]{4}[0-9]{4}/
  
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
end
