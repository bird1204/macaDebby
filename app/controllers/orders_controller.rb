class OrdersController < ApplicationController
  def index
    @orders = Order.all
    
  end

  def new
    @product = Product.find(params[:product_id])
    @order=Order.new
    @delivery_method = {1 => "到店取貨",2 => "貨到付款"}
  end

  def create
    p params
    p "-----------------------"
    p current_customer.present?
    p "------------------------"
    product = Product.find(params[:product_id])
    order=Order.new(params[:order])
    order.status = 1 
    order.payment = 1
    order.enabled = 1
    order.sum_price = (product.price * price.discount * 0.01 * order.quantity).round
    order.customer_id = current_customer if current_customer.present?

    is_save = order.save!

    if params[:commit] == "結賬"
      if is_save
        redirect_to orders_path, :notice => "訂購成功，請從訂單列表確認訂單" 
      else
        redirect_to orders_path, :alert => "訂購失敗"
      end
      
    else
      redirect_to products_path, :notice => "訂購成功，再看看吧" if is_save
    end
  end
end
