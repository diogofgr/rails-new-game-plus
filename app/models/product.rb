class Product < ApplicationRecord
  has_many :product_offers

  # scope :genre, -> (genre) { where genre: genre }
  # scope :location, -> (location_id) { where location_id: location_id }
  scope :starts_with, -> (name) { where("name like ?", "#{name}%")}
end

