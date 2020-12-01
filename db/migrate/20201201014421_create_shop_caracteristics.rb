class CreateShopCaracteristics < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_caracteristics do |t|

      t.timestamps
      t.references :shop, foreign_key: true
      t.references :characteristic, foreign_key: true
    end
  end
end
