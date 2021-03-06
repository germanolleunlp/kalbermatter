class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string  :name, null: false
      t.text    :description
      t.decimal :price, precision: 8, scale: 2
      t.decimal :quantity, precision: 8, scale: 2
      t.integer :style

      t.timestamps null: false
    end
  end
end
