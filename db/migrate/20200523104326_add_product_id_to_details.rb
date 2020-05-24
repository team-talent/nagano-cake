class AddProductIdToDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :details, :product_id, :integer
  end
end
