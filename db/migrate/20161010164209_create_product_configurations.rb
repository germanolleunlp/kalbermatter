class CreateProductConfigurations < ActiveRecord::Migration[5.0]
  def change
    create_table :product_configurations do |t|
      t.belongs_to :product, index: true
      t.belongs_to :order, index: true
      t.integer    :quantity

      t.timestamps null: false
    end
  end
end
