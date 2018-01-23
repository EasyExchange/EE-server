class CreateItempics < ActiveRecord::Migration[5.1]
  def change
    create_table :itempics do |t|
      t.string :picurl
      t.integer :item_id

      t.timestamps
    end
  end
end
