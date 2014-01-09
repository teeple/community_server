class AddUserFromToMessageFlag < ActiveRecord::Migration
  def change
  	add_column :message_flags, :user_from, :integer
  	add_column :message_flags, :user_to, :integer
  	remove_column :message_flags,:user_id
  end
end
