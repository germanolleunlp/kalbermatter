class IngredientConfiguration < ApplicationRecord
  belongs_to :product
  belongs_to :ingredient

  validates :product, :ingredient, :quantity, presence: true
end
