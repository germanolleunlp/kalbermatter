class Ingredient < ApplicationRecord
  has_many :ingredient_configurations, dependent: :destroy

  validates :name, presence: true

  def description
    super || '(none)'
  end

  def stock
    quantity - ingredient_configurations.map(&:quantity).sum
  end
end
