class AddExpireDateToMessage < ActiveRecord::Migration
  def change
  	add_column :messages, :expired_at, :datetime
  end
end
