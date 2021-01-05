class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|

      t.string :name
      t.string :title
      t.text :content
      t.text :open_hour
      t.text :regular_holiday
      t.string :telephone
      t.string :address
      t.string :nearest_station
      t.string :capacity
      t.string :private_room
      t.string :wifi
      t.string :power_supply
      t.references :genre, null: false, foreign_keys: true
      t.references :area, null: false, foreign_keys: true
      t.timestamps
    end
  end
end
