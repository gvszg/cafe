# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  total      :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ActiveRecord::Base

  belongs_to :user

  has_one :info, class_name: "OrderInfo", dependent: :destroy

  accepts_nested_attributes_for :info

  has_many :items, :class_name => "OrderItem", :dependent => :destroy

  def build_item_cache_from_cart(cart)
    cart.items.each do |cart_item|
      item = items.build
      item.product_name = cart_item.title
      item.quantity = 1
      item.price = cart_item.price
      item.save
    end
  end

  def calculate_total!(cart)
    self.total = cart.total_price
    self.save
  end
  
end
