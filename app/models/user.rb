class User < ActiveRecord::Base
  has_many :messages
  has_many :message_flags
  has_many :relations
  
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
end
