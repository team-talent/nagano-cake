class Destination < ApplicationRecord
  belongs_to :customer
  validates :name_tosend, presence: true
  validates :address_tosend, presence: true

end
