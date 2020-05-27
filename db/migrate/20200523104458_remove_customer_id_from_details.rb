class RemoveCustomerIdFromDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :details, :customer_id, :integer
  end
end
