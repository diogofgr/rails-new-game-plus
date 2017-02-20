class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.boolean :seller
      t.string :username
      t.string :address
      t.string :email

      t.timestamps
    end
  end
end
