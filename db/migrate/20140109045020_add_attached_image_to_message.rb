class AddAttachedImageToMessage < ActiveRecord::Migration
  #def change
  #end
  def self.up
    add_attachment :messages, :attached_img
  end 
  def self.down
    remove_attachment :messages, :attached_img
  end 
end
