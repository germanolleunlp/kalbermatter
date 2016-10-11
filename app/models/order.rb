class Order < ApplicationRecord
  has_many :product_configurations

  accepts_nested_attributes_for :product_configurations

  def display_name
    "Order##{id}"
  end

  def total
    product_configurations.map(&:total).sum
  end
end
