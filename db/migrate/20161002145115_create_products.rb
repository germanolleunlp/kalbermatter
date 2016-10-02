class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name

      t.integer :kind_cd
      t.integer :purpose_cd

      t.integer :gender_cd
      t.integer :face_size_cd
      t.integer :nose_size_cd
      t.integer :eye_distance_cd

      t.timestamps null: false
    end
  end
end
