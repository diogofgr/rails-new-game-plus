class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.string :delivery_address
      t.string :return_address
      t.string :order_status

      t.timestamps
    end
  end
end
