class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :message
      t.binary :message_img
      t.integer :user_id

      t.timestamps
    end
  end
end
