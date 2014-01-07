class AddDefaultValueToUserType < ActiveRecord::Migration
  def change
  	change_column :users, :user_type, :boolean, :default => false
  end
end
