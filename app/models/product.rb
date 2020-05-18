class Product < ApplicationRecord
  has_many :carts

  belongs_to :genre

  attachment :image
end
