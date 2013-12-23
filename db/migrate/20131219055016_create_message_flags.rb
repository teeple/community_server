class CreateMessageFlags < ActiveRecord::Migration
  def change
    create_table :message_flags do |t|
      t.integer :message_id
      t.integer :user_id

      t.timestamps
    end
  end
end
