class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :item_name
      t.decimal :price, precision: 7, scale: 2
      t.string :image_url
      t.string :description
      t.integer :quantity
      t.string :category

      t.timestamps
    end
  end
end
