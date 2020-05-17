class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|

      t.integer :customer_id
      t.string :name_tosend
      t.string :postcode_tosend
      t.string :address_tosend

      t.timestamps
    end
  end
end
