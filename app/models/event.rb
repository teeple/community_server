class Event < ActiveRecord::Base
  has_many :sms_notifications,  class_name: 'SmsNotification'
end
