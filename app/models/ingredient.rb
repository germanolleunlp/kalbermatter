class Ingredient < ApplicationRecord
  has_many :ingredient_configurations, dependent: :destroy

  validates :name, presence: true

  def description
    super || '(none)'
  end

  def display_name
    "#{name} - Available: (#{quantity})"
  end

  def stock
    quantity - ingredient_configurations.map(&:quantity).sum
  end
end
