class Cart < ApplicationRecord
  belongs_to :user
  has_many :products, through: :cart_items
  has_many :cart_items, dependent: :destroy

  def add_product(product)
    cart_item = cart_items.find_by(product: product)

    if cart_item
      cart_item.increment(:quantity)
    else
      cart_item = cart_items.build(product: product, quantity: 1)
    end

    cart_item.save
  end

  def total_price
    cart_items.sum { |item| item.product.price * item.quantity }
  end

  def create_order
    order = user.orders.create

    cart_items.each do |cart_item|
      order.order_items.create(
        product: cart_item.product,
        quantity: cart_item.quantity,
        price: cart_item.product.price
      )
    end

    cart_items.destroy_all
    order
  end
end
