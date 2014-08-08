class Product < ActiveRecord::Base
  attr_accessible :name, :intro ,:desc ,:price ,:discount, :enabled
  has_many :product_images
  has_many :orders
end
