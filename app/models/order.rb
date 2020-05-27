class Order < ApplicationRecord
  belongs_to :customer
  has_many :details
  enum order_status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済: 4}
  enum pay: {クレジットカード: 0, 銀行振込: 1}
  validates :address_tosend, presence: true
  validates :name_tosend, presence: true

      include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
end
