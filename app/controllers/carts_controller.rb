class CartsController < ApplicationController

  def clean
    current_cart.cart_items.destroy_all
    flash[:warning] = "已清空購物車"
    redirect_to carts_path
  end
  
end
