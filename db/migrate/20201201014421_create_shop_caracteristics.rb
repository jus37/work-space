class CreateShopCaracteristics < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_caracteristics do |t|

      t.timestamps
      t.references :shop, null: false, foreign_key: true
      t.references :characteristic, null: false, foreign_key: true
    end
  end
end
