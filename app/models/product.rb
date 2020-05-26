class Product < ApplicationRecord
  has_many :carts

  belongs_to :genre

  attachment :image

  validates :name, presence: true
  validates :price, presence: true
  validates :explain, presence: true
  validates :sale_status, presence: true
end
