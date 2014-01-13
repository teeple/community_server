class SmsNotification < ActiveRecord::Base
	belongs_to :user,  class_name: 'User',foreign_key: :receiver_user_id
end
