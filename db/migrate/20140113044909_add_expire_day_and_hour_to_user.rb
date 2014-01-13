class AddExpireDayAndHourToUser < ActiveRecord::Migration
  def change
    add_column :users, :expire_day, :integer
    add_column :users, :expire_hour, :integer
  end
end
