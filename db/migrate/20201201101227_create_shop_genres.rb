class CreateShopGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_genres do |t|

      t.timestamps
    end
  end
end
