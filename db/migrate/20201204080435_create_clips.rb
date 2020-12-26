class CreateClips < ActiveRecord::Migration[6.0]
  def change
    create_table :clips do |t|

      t.timestamps
      t.references :user, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true
    end
  end
end
