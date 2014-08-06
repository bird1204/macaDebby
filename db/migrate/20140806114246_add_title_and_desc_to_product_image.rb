class AddTitleAndDescToProductImage < ActiveRecord::Migration
  def change
    add_column :product_images , :title , :string
    add_column :product_images , :description , :text
  end
end
