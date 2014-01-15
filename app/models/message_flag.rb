class MessageFlag < ActiveRecord::Base
    belongs_to :message
	belongs_to :follower,  class_name: 'User',foreign_key: :user_to
	belongs_to :followee,  class_name: 'User',foreign_key: :user_from
end
