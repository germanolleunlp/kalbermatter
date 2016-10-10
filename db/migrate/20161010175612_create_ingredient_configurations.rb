class CreateIngredientConfigurations < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredient_configurations do |t|
      t.belongs_to :product, index: true
      t.belongs_to :ingredient, index: true
      t.decimal    :quantity, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
