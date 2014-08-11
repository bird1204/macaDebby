class Product < ActiveRecord::Base
  attr_accessible :name, :intro ,:desc ,:price ,:discount, :enabled, :is_top

  has_many :product_images
  has_many :orders

  scope :product_enable, where(:enabled => true)
  scope :desc_order, order("id desc")
end
