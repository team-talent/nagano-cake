class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|

      t.integer :customer_id
      t.integer :order_id
      t.integer :product_vol
      t.integer :product_price
      t.integer :production_status

      t.timestamps
    end
  end
end
