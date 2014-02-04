class SmsNotification < ActiveRecord::Base
	establish_connection "newbiz_noti"
	belongs_to :user,  class_name: 'User',foreign_key: :receiver_user_id
	belongs_to :event, class_name: 'Event'
end
