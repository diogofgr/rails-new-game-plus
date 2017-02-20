class AddProductOfferIdToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :product_offer_id, :integer
  end
end
