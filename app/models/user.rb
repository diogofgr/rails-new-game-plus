class User < ApplicationRecord
  has_many :transactions
  has_many :product_offers
  has_many :products, through: :product_offers

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :address, presence: true
end
