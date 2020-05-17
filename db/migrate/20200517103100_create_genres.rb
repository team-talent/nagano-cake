class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|

      t.string :category_name
      t.boolean :genre_status

      t.timestamps
    end
  end
end
