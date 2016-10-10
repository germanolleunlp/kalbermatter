class ProductConfiguration < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true

  def price
    quantity * product.price
  end
end
