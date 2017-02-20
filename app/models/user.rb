class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :transactions
  has_many :product_offers
  has_many :products, through: :product_offers

  validates :email, uniqueness: true, presence: true
  # validates :address, presence: true
end
