class OrdersController < ApplicationController


  def index
    if current_customer.present?
      @orders = Order.where(:customer_id => current_customer.id) 
    else
      respond_to do |format|
        format.html { render  :action => "warning" } # 指定使用 index 的 tamplate
      end
    end
  end

  def new
    @product = Product.find(params[:product_id])
    @order=Order.new
    @delivery_method = {1 => "到店取貨",2 => "貨到付款"}
  end

  def create
    product = Product.find(params[:product_id])
    order=Order.new(params[:order])

    order.status = 1  # {1 => "處理中",2 => "已接受",3 => "已發貨", 9 => "申請中" , 9 => "已取消訂單"}
    order.payment = 1
    order.enabled = 1
    order.sum_price = (product.price * product.discount * 0.01 * order.quantity).round
    order.customer_id = current_customer if current_customer.present?

    is_save = order.save!

    if params[:commit] == "結賬"
      if is_save
        redirect_to search_orders_path(:order_id => order.id), :notice => "訂購成功，請從訂單列表確認訂單" 
      else
        redirect_to search_orders_path(:order_id => order.id), :alert => "訂購失敗"
      end
      
    else
      redirect_to products_path, :notice => "訂購成功，再看看吧" if is_save
    end
  end

  def edit
    @order=Order.find(params[:id])
    @product=@order.product
    @delivery_method = {1 => "到店取貨",2 => "貨到付款"}
  end

  def update
    message = "取消修改"
    if params[:commit] == "確認修改"
      order=Order.find(params[:id])
      params[:order][:sum_price] = (order.product.price * order.product.discount * 0.01 * order.quantity).round
      order.update_attributes!(params[:order])
      message = "修改完成"
    end
    redirect_to search_orders_path(:order_id => params[:id]), :notice => message
  end

  def destroy
    order = Order.find(params[:id])
    order.status = 9
    order.save!

    redirect_to search_orders_path(:order_id => params[:id]), :notice => "訂單取消處理中"
  end

  def search
    @orders=Order.where("id = ? or delivery_mobile = ?", params[:order_id], params[:order_id])

    respond_to do |format|
      format.js
      format.html { render :action => "index" } # 指定使用 index 的 tamplate
    end
  end
end
