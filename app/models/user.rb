class User < ActiveRecord::Base
    has_many :messages
    has_many :message_flags
    has_many :relations
end
