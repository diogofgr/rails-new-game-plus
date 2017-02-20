class Transaction < ApplicationRecord
  belongs_to :user #as buyer_id
  belongs_to :product_offers #will get a user Id through
  validates :delivery_address, presence: true
  validates :return_address, true
end
