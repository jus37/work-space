class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|

      t.timestamps
      t.string :name, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.text :open_hour
      t.text :regular_holiday
      t.string :telephone
      t.string :address
      t.string :nearest_station
      t.string :capacity
      t.string :private_room
      t.string :wifi
      t.string :power_supply
    end
  end
end
