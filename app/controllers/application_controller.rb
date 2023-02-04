class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_render_cart

  def set_render_cart
    @render_cart = true
  end

  def initialize_cart
    @cart ||= Cart.find_by(id: session[:cart_id])

    if @cart.nil?
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end

  def after_sign_in_path_for(resource)
    store_path
  end

  def after_update_path_for(resource)
    store_path
  end
end
