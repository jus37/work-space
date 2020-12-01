class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|

      t.timestamps
      t.string :name, null: false
    end
  end
end
