class AddGidToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :gid, :integer
  end
end
