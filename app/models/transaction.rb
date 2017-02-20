class Transaction < ApplicationRecord
  belongs_to :user, foreign_key: "buyer_id"
  belongs_to :product_offers

  validates :delivery_address, presence: true
  validates :return_address, true
end
