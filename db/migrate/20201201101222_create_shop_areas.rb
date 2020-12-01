class CreateShopAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_areas do |t|

      t.timestamps
    end
  end
end
