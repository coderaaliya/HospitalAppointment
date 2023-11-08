class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart || current_user.create_cart
  end

  def checkout
    @order = current_user.cart.create_order
    current_user.cart.destroy
    redirect_to order_path(@order), notice: 'Order was successfully created.'
  end
end
