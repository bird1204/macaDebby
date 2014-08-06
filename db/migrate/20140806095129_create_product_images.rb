class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.string :name
      t.text :url
      t.boolean :enabled
      t.timestamps
    end
  end
end
