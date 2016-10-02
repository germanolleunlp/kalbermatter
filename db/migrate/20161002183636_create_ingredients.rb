class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.string :name, null: false
      t.text :description

      t.belongs_to :product, index: true

      t.timestamps null: false
    end
  end
end
