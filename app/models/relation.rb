class Relation < ActiveRecord::Base
    belongs_to :follower, class_name: 'User', foreign_key: 'user_from'
    belongs_to :followee, class_name: 'User', foreign_key: 'user_to'
end
