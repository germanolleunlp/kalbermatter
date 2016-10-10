class Order < ApplicationRecord
  has_many :product_configurations

  def to_s
    "Order##{id}"
  end

  def price
    product_configurations.map(&:price).sum
  end
end
