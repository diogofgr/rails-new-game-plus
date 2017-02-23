class AddCoverUrlToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :cover_url, :string
  end
end
