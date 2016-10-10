class Product < ApplicationRecord
  has_many :ingredient_configurations, dependent: :destroy
  has_many :product_configurations, dependent: :destroy

  enum style: { other: 0, ale: 1, lager: 2 }
  validates :name, :style, :price, presence: true

  def to_s
    name
  end
end
