class User < ActiveRecord::Base
 # include SessionsHelper
 attr_accessor :remote_ip

  # after_create :test_aa
  after_create :save_imsi_ecgi
 
  has_many :messages
  has_many :message_flags
  has_many :relations, class_name: 'Relation', foreign_key: :user_from, dependent: :destroy
  has_many :users, through: :relations
  
  scope :users_general, where(user_type: false).order("user_name asc") 
  scope :users_cafe, where(user_type: true).order("user_name asc") 

  validates :phone_no, 
            :uniqueness => true,
            :presence => true,
            :format => {:with => /010[0-9]{4}[0-9]{4}/}

  # maximum 15 글자는 체크 안함. 입력단에서 체크 필요 
  validates :user_name, 
            :uniqueness => true, 
            :format => {:with => /\A[\w\.\-]+\Z/},
            :presence => true

  validate :validate_imsi_ecgi, on: :create

  def self.followers(user)
    user.users.order("user_name asc")
  end

  def self.not_followers(user)
    (User.users_general - Array(user) - User.followers(user))
  end

  def self.cafes(user)
    (User.users_cafe - Array(user) - User.followers(user))
  end

  def validate_imsi_ecgi
    if remote_ip and valid?(:user_name) and valid?(:phone_no)
      # call API server with ip_address
      response = Apis.get_imsi_ecgi(remote_ip)
      if response.code == 200
        xml_parser = Nori.new
        
        result = xml_parser.parse(response.body)
        imsi = result['BODY']['IMSI']
        ecgi = result['BODY']['ECGI']

        self.imsi = imsi
        self.ecgi = ecgi

      end
    end
  end
 
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def save_imsi_ecgi
    logger.debug self.imsi
    logger.debug self.ecgi
  end

end
