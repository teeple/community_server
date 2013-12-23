class Relation < ActiveRecord::Base
    belongs_to :user, class_name: 'User', foreign_key: 'user_from'
    belongs_to :user, class_name: 'User', foreign_key: 'user_to'
end
