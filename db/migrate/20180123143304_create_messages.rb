class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer :item_id
      t.integer :sender_id
      t.integer :receiver_id
      t.text :content
      t.datetime :time

      t.timestamps
    end
  end
end
