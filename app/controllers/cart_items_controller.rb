class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    product = Product.find(params[:product_id])

    # Ensure the user has a cart
    if current_user.cart.nil?
      current_user.create_cart
    end

    current_user.cart.add_product(product)
    redirect_to cart_path, notice: 'Product added to cart successfully.'
  end

  def update
    @cart_item = current_user.cart.cart_items.find(params[:id])
    @cart_item.update(quantity: params[:quantity])
    redirect_to cart_path, notice: 'Cart updated successfully.'
  end

  def destroy
    @cart_item = current_user.cart.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path, notice: 'Product removed from cart successfully.'
  end

  def decrease_quantity
    @cart_item = current_user.cart.cart_items.find(params[:id])
    if @cart_item.quantity > 1
      @cart_item.decrement(:quantity)
      @cart_item.save
    else
      @cart_item.destroy
    end
    redirect_to cart_path, notice: 'Quantity updated successfully.'
  end

  def increase_quantity
    @cart_item = current_user.cart.cart_items.find(params[:id])
    @cart_item.increment(:quantity)
    @cart_item.save
    redirect_to cart_path, notice: 'Quantity updated successfully.'
  end
end
