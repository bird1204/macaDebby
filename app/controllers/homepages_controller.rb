class HomepagesController < ApplicationController
  def index
    @top_product = Product.where(:is_top => true)
    p @top_product
  end
end
