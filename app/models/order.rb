class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  

  def total_price
    order_items.sum { |item| item.product.price * item.quantity }
  end
end
