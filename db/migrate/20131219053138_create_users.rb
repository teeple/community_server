class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :phone_no
      t.string :imsi
      t.string :ecgi
      t.string :description
      t.binary :profile_img

      t.timestamps
    end
  end
end
