class User < ActiveRecord::Base
 # include SessionsHelper
  attr_accessor :remote_ip
  paginates_per 7

  has_many :messages, class_name: 'Message', foreign_key: :user_id, dependent: :destroy
  has_many :message_flags,  class_name: 'MessageFlag', foreign_key: :user_from, dependent: :destroy
  has_many :relations, class_name: 'Relation', foreign_key: :user_from, dependent: :destroy
  has_many :users, through: :relations
  
  scope :users_general, -> {where(user_type: false).order("user_name asc")}
  scope :users_cafe, -> {where(user_type: true).order("user_name asc")}

  scope :users_general_without, -> (id) {where(user_type: false).where.not(id: id)}
  scope :users_cafe_without, -> (id) {where(user_type: true).where.not(id: id)}

  scope :users_with_relationship, -> (user) {where(id: user.users.pluck(:id))}

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

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  def self.followers(user, page_num)
    user.users.order("user_name asc").page(page_num)
  end

  def self.my_followers(user)
    Relation.where(:user_to => user.id)
  end

  def self.my_followers_count(user)
    Relation.where(:user_to => user.id).count
  end

  def self.not_followers(user, page_num)
    #User.where.not(id: user.id).where(user_type: false).where.not(id: user.users.pluck(:id)).page(page_num)
    User.users_general_without(user.id).where.not(id: User.users_with_relationship(user)).page(page_num)
  end

  def self.cafes(user, page_num)
    User.users_cafe_without(user.id).where.not(id: User.users_with_relationship(user)).page(page_num)
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

        tracking_response = Apis.tracking_on(imsi,ecgi)
        
        if tracking_response.code == 200
          tracking_result = xml_parser.parse(tracking_response.body)
          # logger.debug("---------------------")
          # logger.debug(tracking_result)
        end
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
