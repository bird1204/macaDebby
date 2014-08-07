class ProductsController < ApplicationController
  def index
    products = Product.where(:enabled => true)
    @products = Array.new

    products.each do |product|
      url = "logo.png"
      url = product.product_images.first.url if product.product_images.present?
      @products << {:intro => product.intro, :name => product.name, :url => url ,:id => product.id}
    end
  end

  def show
    @product = Product.find(params[:id])
    @images = ["logo.png"]
    @images = @product.product_images if @product.product_images.present?

  end
end
