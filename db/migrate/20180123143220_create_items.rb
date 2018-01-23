class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :detail
      t.datetime :publish_time
      t.integer :original_price
      t.integer :second_price
      t.integer :wear_level #数字越大表示磨损越严重
      t.string :tag
      t.integer :state #0:已下架  1:出售中
      t.integer :user_id

      t.timestamps
    end
  end
end
