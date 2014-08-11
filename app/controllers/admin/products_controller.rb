class Admin::ProductsController < AdminController
  before_filter :init_product , :only => [:edit,:update,:show,:destroy]
  def index
    @products = Product.product_enable.desc_order.paginate(:page => params[:page], :per_page => 10)
  end

  def edit
  end

  def update
    @product.update_attributes!(params[:product])
    redirect_to_success_path
  rescue Exception => e
    logger.error(e)
    redirect_to_alert_path(e)
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(params[:product])
    product.save!
    redirect_to_success_path
  rescue Exception => e
    logger.error(e)
    redirect_to_alert_path(e)
  end

  def show
  end

  def destroy
    @product.enabled = false
    @product.save!
    redirect_to_success_path
  rescue Exception => e
    logger.error(e)
    redirect_to_alert_path(e)
  end

  def search
    # search_sql_merge(原始SQL,表單欄位名稱,條件式欄位字串,{value,keyword} => 一般欄位對應用 value)
    sql_parameter = Array("select products.* from products ") # 這樣寫就會直接把字串轉乘陣列
    sql_parameter = search_sql_merge(sql_parameter,"is_enabled","products.enabled","value")
    sql_parameter = search_sql_merge(sql_parameter,"keyword",["products.name"],"keyword")
    sql_parameter[0] << " order by products.id DESC"

    @products = Product.paginate_by_sql(sql_parameter, :page => params[:page], :per_page => 30)
    respond_to do |format|
      format.js
      format.html { render :action => "index" } # 指定使用 index 的 tamplate
    end
    
  end

  private
  def init_product
    @product = Product.find(params[:id])
  end

  def redirect_to_success_path
    redirect_to admin_products_path, :notice => "成功"
  end

  def redirect_to_alert_path(error_message)
    redirect_to admin_products_path, :alert => "失敗, #{error_message}" 
  end
end
