class Genre < ApplicationRecord
  has_many :products

  validates :category_name, presence: true
  validates :genre_status, inclusion: {in: [true, false]}

end
