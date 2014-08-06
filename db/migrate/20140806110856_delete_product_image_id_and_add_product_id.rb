class DeleteProductImageIdAndAddProductId < ActiveRecord::Migration
  def change
    add_column :product_images , :product_id , :integer
    remove_column :products , :product_image_id
  end
end
