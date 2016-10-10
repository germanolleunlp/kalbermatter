class IngredientConfiguration < ApplicationRecord
  belongs_to :product
  belongs_to :ingredient

  validates :quantity, presence: true
end
