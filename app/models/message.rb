class Message < ActiveRecord::Base
  include Apis

  belongs_to :user
  before_save :set_expire_day_and_hour
  has_many :message_flags,  class_name: 'MessageFlag', dependent: :destroy

  paginates_per 5

  has_attached_file :attached_img

  after_create :make_message_as_unread_and_send_noti, :activate_cleanup
  
  def self.search(keyword,page_num)
    Message.where('message like ?','%'+keyword+'%').order("created_at desc").page(page_num)
  end

  def self.my_messages(user, page_num)
	  #Message.all.page(page_num)
  end

  def self.friends_messages(user,page_num)
    Message.all.where(:user_id => user.users.pluck(:id)).order("created_at desc").page(page_num)
  end

  def self.check_unread_and_make_it_read(message,user)
    unread_message = Message.find(message.id).message_flags.where(:user_to=>user.id)
    is_unread = unread_message.count > 0 ? true : false;
    unread_message.destroy_all
    is_unread
  end

  def activate_cleanup
    self.delay(run_at: self.expired_at).perform_cleanup
  end

  def perform_cleanup
    MessageFlag.where(:message_id => self.id).destroy_all
  end

  def make_message_as_unread_and_send_noti
    
    sms_message = self.user.user_name + ' 님이 새 글을 등록하셨습니다. ' + ENV['COM_SERVER_URL'] + '/users/' + self.user.id.to_s + '?tab=message'

    event = Event.create!(:event_type => 'post')

    User.relation_follows_me(self.user).each do |relation|
      MessageFlag.create!(:message_id => self.id, :user_from => self.user.id, :user_to => relation.user_from)
      
      if relation.event_post
        # same zone check
        follower = User.find(relation.user_from)
        response = Apis.location_fetch(follower.imsi)  
        if response.code == 200
          xml_parser = Nori.new
          
          result = xml_parser.parse(response.body)
          ecgi = result['BODY']['ECGI']
          
          if self.user.ecgi == ecgi
            SmsNotification.create!(
              :receiver_user_id => follower.id, 
              :sms_message => sms_message, 
              :receiver_phone_no => follower.phone_no, 
              :event_type => event.event_type, 
              :event_id => event.id,
              :status => 'NEW')
          end
        end
      end
    end
  end


  def set_expire_day_and_hour
    case self.user.user_type
      when true # user_type => cafe
        # expired_at이 설정되어 있으면, 그 값을 사용하고, 그렇지 않으면 Profile의 expire day, hour를 가져와서 이를 활용
        # expire_day = self.user.expire_day ? self.user.expire_day.day : ENV['EXPIRE_DAY'].to_i.day
        # expire_hour = self.user.expire_hour ? self.user.expire_hour.hour : ENV['EXPIRE_HOUR'].to_i.hour
        # self.expired_at = Time.now + expire_day + expire_hour unless self.expired_at
        self.expired_at = 2.minutes.from_now
      when false # user_type => general
        # self.expired_at = Time.now + ENV['EXPIRE_DAY'].to_i.day + ENV['EXPIRE_HOUR'].to_i.hour
        self.expired_at = 1.minutes.from_now
    end
  end
end
