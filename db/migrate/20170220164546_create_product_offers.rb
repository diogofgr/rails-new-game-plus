class CreateProductOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :product_offers do |t|
      t.references :users, foreign_key: true
      t.references :products, foreign_key: true
      t.integer :price
      t.string :location

      t.timestamps
    end
  end
end
