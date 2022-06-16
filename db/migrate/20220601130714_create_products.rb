class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.references :user, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true
      t.string :title
      t.string :name
      t.string :category
      t.string :germany
      t.integer :quantity
      t.integer :weight
      t.float :price
      t.datetime :buy
      t.datetime :expiry
      t.integer :keep
      t.datetime :end
      t.string :shop
      t.boolean :sale
      t.boolean :bought
      t.float :total
      t.integer :rate
      t.boolean :out

      t.timestamps
    end
  end
end
