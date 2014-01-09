class Message < ActiveRecord::Base
    belongs_to :user
    has_many :message_flags

    paginates_per 7

    has_attached_file :attached_img, :styles => { :medium => "300x300>"}
end
