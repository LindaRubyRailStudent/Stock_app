class CreateStockResources < ActiveRecord::Migration
  def change
    create_table :stock_resources do |t|
      t.string :symbol
      t.string :price
      t.string :change
      t.string :volume

      t.timestamps
    end
  end
end
