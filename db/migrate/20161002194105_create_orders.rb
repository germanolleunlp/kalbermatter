class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.text :description, null: false

      t.timestamps null: false
    end
  end
end
