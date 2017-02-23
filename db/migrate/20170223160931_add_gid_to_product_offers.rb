class AddGidToProductOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :product_offers, :gid, :integer
  end
end
