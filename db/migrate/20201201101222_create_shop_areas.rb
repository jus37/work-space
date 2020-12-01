class CreateShopAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_areas do |t|

      t.timestamps
      t.references :shop, foreign_key: true
      t.references :area, foreign_key: true
    end
  end
end
