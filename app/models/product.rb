class Product < ApplicationRecord
  has_many :ingredient_configurations, dependent: :destroy
  accepts_nested_attributes_for :ingredient_configurations

  has_many :product_configurations, dependent: :destroy

  enum style: { other: 0, ale: 1, lager: 2 }
  validates :name, :style, :price, presence: true

  def description
    super || '(none)'
  end

  def display_name
    "#{name} - Available: (#{quantity})"
  end

  def stock
    quantity - product_configurations.map(&:quantity).sum
  end

  def build_ingredients(new_ingredients = 0)
    new_ingredients.times { ingredient_configurations.build }
    self
  end
end
