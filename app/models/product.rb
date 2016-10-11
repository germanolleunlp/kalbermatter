class Product < ApplicationRecord
  has_many :ingredient_configurations, dependent: :destroy
  has_many :product_configurations, dependent: :destroy

  enum style: { other: 0, ale: 1, lager: 2 }
  validates :name, :style, :price, presence: true

  def description
    super || '(none)'
  end

  def display_name
    name
  end

  def stock
    quantity - product_configurations.map(&:quantity).sum
  end
end
