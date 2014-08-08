class CustomersController < ApplicationController
  before_filter :login_required

  def orders
    @orders = Order.where(:delivery_mobile => current_customer.mobile)
    
  end

  def index
    #放所有優惠
    
  end

  def show
    @name = "[ 會員資料不完全 ]"
    @name = current_customer.name if current_customer.name.present?
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(params[:id])

  end

  def update
    message = "取消修改"
    @customer = Customer.find(params[:id])
    if params[:commit] == "確認修改"
      @customer.update_attributes!(params[:customer]) 
      message = "修改成功"
    end
    redirect_to customer_path(@customer.id), :notice => message
  end
end
