class ProductImage < ActiveRecord::Base
  attr_accessible :name, :url, :product_id, :title , :description
  belongs_to :product
end
