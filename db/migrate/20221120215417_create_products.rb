class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :price, precision: 5, scale: 2, null: false
      t.integer :stock
      t.string :weigth
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
