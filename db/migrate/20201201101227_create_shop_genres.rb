class CreateShopGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_genres do |t|

      t.timestamps
      t.references :shop, foreign_key: true
      t.references :genre, foreign_key: true
    end
  end
end
