class CreateHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :histories do |t|

      t.timestamps
      t.references :user, null: false, foreign_keys: true
      t.references :shop, null: false, foreign_keys: true
    end
  end
end
