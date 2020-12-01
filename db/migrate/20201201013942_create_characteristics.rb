class CreateCharacteristics < ActiveRecord::Migration[6.0]
  def change
    create_table :characteristics do |t|

      t.timestamps
      t.string :name, null: false
    end
  end
end
