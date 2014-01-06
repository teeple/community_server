class User < ActiveRecord::Base
  include ApisHelper
  include SessionsHelper

  after_create :signed_in_user
 
  has_many :messages
  has_many :message_flags
  has_many :relations

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
  
  def validate_imsi_ecgi
    
    if @remote_ip and self.valid?(:user_name) and self.valid?(:phone_no)
      ip_address = @remote_ip
      logger.debug '$$$$$$'
      logger.debug ip_address
      # call API server with ip_address
      response = get_imsi_ecgi(ip_address)
      if response.code == 200
        xml_parser = Nori.new
        
        result = xml_parser.parse(response.body)
        imsi = result['BODY']['IMSI']
        ecgi = result['BODY']['ECGI']

        self.imsi = imsi
        self.ecgi = ecgi

      else 
        errors.add_to_base("망에 해당 정보가 없습니다")
      end
    end
  end
 
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
end
