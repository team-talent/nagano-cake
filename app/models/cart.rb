class Cart < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  validates :vol, presence: true
end
