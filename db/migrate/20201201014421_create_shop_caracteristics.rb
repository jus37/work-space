class CreateShopCaracteristics < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_caracteristics do |t|

      t.timestamps
    end
  end
end
