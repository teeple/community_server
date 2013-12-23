class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.integer :user_from
      t.integer :user_to
      t.boolean :event_entry
      t.boolean :event_exit
      t.boolean :event_post

      t.timestamps
    end
  end
end
