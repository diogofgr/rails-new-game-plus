class Product < ApplicationRecord
  has_many :product_offers

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
    # where("name ILIKE ?", "%bat%")

  end

# Use this ine to search in other fields, not only name;
# where("name LIKE ? OR ingredients LIKE ? OR cooking_instructions LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")


end

