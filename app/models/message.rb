class Message < ActiveRecord::Base
  belongs_to :user
  has_many :message_flags

  paginates_per 7

  has_attached_file :attached_img

  after_create :make_message_as_unread
  
  def self.my_messages(user, page_num)
	#User.users_cafe_without(user.id).where.not(id: User.users_with_relationship(user)).page(page_num)
  Message.all.page(page_num)
  end

  def make_message_as_unread
    #MessageFlag.create(:user_from => self.user_id,)
    User.my_followers(self.user).each do |relation|
      MessageFlag.create(:message_id => self.id, :user_from => self.user.id, :user_to => relation.user_from)
    end
  end
end
