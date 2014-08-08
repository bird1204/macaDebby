class Order < ActiveRecord::Base
  attr_accessible :delivery_mobile, :delivery_name, :delivery_address , :delivery_method , :quantity, :sum_price, :product_id
  belongs_to :product
  belongs_to :customer
end
