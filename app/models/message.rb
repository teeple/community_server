class Message < ActiveRecord::Base
  belongs_to :user
  has_many :message_flags,  class_name: 'MessageFlag', dependent: :destroy

  paginates_per 7

  has_attached_file :attached_img

  after_create :make_message_as_unread
  
  def self.my_messages(user, page_num)
	  #Message.all.page(page_num)
  end

  def self.friends_messages(user,page_num)
    Message.all.where(:user_id => user.users.pluck(:id)).order("created_at desc").page(page_num)
  end

  def make_message_as_unread
    User.my_followers(self.user).each do |relation|
      MessageFlag.create(:message_id => self.id, :user_from => self.user.id, :user_to => relation.user_from)
    end
  end
end
