class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|

      t.timestamps

      t.integer :review_point, null: false
      t.date :date, null: false
      t.string :title, null: false
      t.string :comment, null: false
      t.references :user, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true
    end
  end
end
