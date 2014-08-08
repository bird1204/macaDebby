class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.integer :product_id
      t.string :name
      t.string :title
      t.text :description
      t.text :url
      t.boolean :enabled
      t.timestamps
    end
  end
end
