class CreateApis < ActiveRecord::Migration
  def change
    create_table :apis do |t|
      t.string :ip
      t.string :imsi
      t.string :ecgi

      t.timestamps
    end
  end
end
