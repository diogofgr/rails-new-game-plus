# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Product.destroy_all
Transaction.destroy_all

all_names = [ "ciaran", "diogo", "filipe"]
all_games = [ "Pro Evolution Soccer", "Batman Arkham", "Tomb Raider and the Curse of the Vagina"]

all_names.each do |name|
  User.create(email: "#{name}_69@mail.pt", password: "123456")
end

all_games.each do |game|
  Product.create(name: "#{game}", release_year: rand(2004..2016))
end

user_offset = rand(User.count)
game_offset = rand(Product.count)

rand_user = User.offset(user_offset).first
rand_game = Product.offset(game_offset).first

offer = ProductOffer.new
offer.user = rand_user
offer.product = rand_game
offer.price = rand(5..15)
offer.location = "some location"
offer.save

# Seed with example cocktails
# urls = [
#   "mojito_juqqug.jpg",
#   "tequilla-sunrise_nfo157.jpg",
#   "san-francisco_pfuods.jpg",
#   "pinacolada_yxbdyu.jpg",
#   "gin-titanic_w5uzqm.jpg"
# ]
# cocktail_1 = Cocktail.new(name: "Mojito")
# cocktail_1.photo_url = "http://res.cloudinary.com/dpfv7sbu4/image/upload/v1487341784/#{urls[0]}"
# cocktail_1.save!
