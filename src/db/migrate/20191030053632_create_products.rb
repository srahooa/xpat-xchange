class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :user, foreign_key: true
      t.string :product_name
      t.string :origin_country
      t.integer :voltage
      t.string :plug_type
      t.string :condition
      t.string :current_country
      t.string :current_city
      t.decimal :price

      t.timestamps
    end
  end
end
