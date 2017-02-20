class CreateProductOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :product_offers do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :price
      t.string :location

      t.timestamps
    end
  end
end
