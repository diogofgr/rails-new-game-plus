class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :platform
      t.string :genre
      t.integer :release_year

      t.timestamps
    end
  end
end
