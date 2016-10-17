class Order < ApplicationRecord
  has_many :product_configurations
  accepts_nested_attributes_for :product_configurations

  validates :description, presence: true

  def display_name
    "Order##{id}"
  end

  def total
    product_configurations.map(&:total).sum
  end

  def build_products(new_products = 0)
    new_products.times { product_configurations.build }
    self
  end
end
