class AddIndexToTables < ActiveRecord::Migration
  def change
    add_index :messages, :user_id
    add_index :message_flags, [:user_id, :message_id]
    add_index :message_flags, :user_id
    add_index :message_flags, :message_id
    add_index :relations, :user_from
    add_index :relations, :user_to
    add_index :relations, [:user_from, :user_to]
  end
end
