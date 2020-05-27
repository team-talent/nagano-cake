class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :customer_id
      t.integer :send_fee
      t.integer :total_price
      t.integer :pay
      t.string :name_tosend
      t.string :postcode_tosend
      t.string :address_tosend
      t.integer :order_status

      t.timestamps
    end
  end
end
