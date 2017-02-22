class ProductOffer < ApplicationRecord
  belongs_to :user # as "seller_id"
  belongs_to :product
  has_one :transcation

  validates :price, presence: true
  validates :location, presence: true


end
