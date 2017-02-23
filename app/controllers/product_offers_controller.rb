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
    url = "https://igdbcom-internet-game-database-v1.p.mashape.com/games/?fields=name%2Crelease_dates%2Ccover&limit=12&order=name%3Aasc&search=" + @search_term
    results = Unirest.get url,
      headers:{
        "X-Mashape-Key" => ENV["x_mashape_key"],
        "Accept" => "application/json"
      }
    @results = []
    results.body.each_with_index do |game, index|
      game_array = [game["name"], game["cover"]["url"], game["release_dates"].first["y"]]
      @results << game_array
    end
    @results
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
end

private
  def product_offer_params
    params.require(:product_offer).permit(:price, :location, :product_id)
  end
