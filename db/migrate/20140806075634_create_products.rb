class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.integer :discount
      t.integer :product_image_id
      t.boolean :enabled
      t.timestamps
    end
  end
end
