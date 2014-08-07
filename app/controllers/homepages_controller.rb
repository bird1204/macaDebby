class HomepagesController < ApplicationController
  def index
    @top_product = Product.where(:is_top => true)
  end
end
