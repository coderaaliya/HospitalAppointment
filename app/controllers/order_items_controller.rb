class OrderItemsController < ApplicationController
  before_action :authenticate_user!

  def index
  @order = current_user.orders.find_by(id: params[:order_id])

  unless @order
    redirect_to orders_path, alert: 'Order not found'
    return
  end

  @order_items = @order.order_items
end
end