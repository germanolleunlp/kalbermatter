class ProductConfiguration < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :order, :product, :quantity, presence: true

  def total
    quantity * product.price
  end

  def display_name
    "#{product.name} - x#{quantity}"
  end
end
