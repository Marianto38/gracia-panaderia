class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    @products = Product.order(:name)
  end

  def show
    @producr = Product([product_id])
    
  end

end
