class ProductOffersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @product_offer = ProductOffer.new
  end

  def search
    @search_term = params[:search]
    search_term = @search_term.gsub(" ", "")
    url = "https://igdbcom-internet-game-database-v1.p.mashape.com/games/?fields=name%2Crelease_dates%2Ccover&limit=12&order=release_dates.date%3Adesc&search=" + search_term
    results = Unirest.get url,
      headers:{
        "X-Mashape-Key" => ENV["x_mashape_key"],
        "Accept" => "application/json"
      }
    @results = []
    results.body.each do |game|
      game["cover"].nil? ? game_cover_url = "http://placehold.it/300x500" : game_cover_url = game["cover"]["url"]
      game["release_dates"].nil? ? release_date = "Unknown" : release_date = game["release_dates"].first["y"]

      game_hash = {name: game["name"], cover_url: game_cover_url, release_date: release_date}
      @results << game_hash
    end
    @product_offer = ProductOffer.new
    render :new
  end

  def create
    @user = current_user

    @new_product_offer = ProductOffer.new(product_offer_params)
    @new_product_offer.user =  @user
    #// @new_product_offer.product - currently being asked to user to input as a integer

    if @new_product_offer.save
      redirect_to product_path(product_offer_params[:product_id])
    else
      render :new
    end


# 3.times do
#   user_offset = rand(User.count)
#   game_offset = rand(Product.count)
#   rand_user = User.offset(user_offset).first
#   rand_game = Product.offset(game_offset).first

#   offer = ProductOffer.new
#   offer.user = rand_user
#   offer.product = rand_game
#   offer.price = rand(5..15)
#   offer.location = "some location"
#   offer.save
# end


  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def product_offer_params
    params.require(:product_offer).permit(:price, :location, :product_id)
  end

end
