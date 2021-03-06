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

      game_hash = {name: game["name"], cover_url: game_cover_url, release_date: release_date, gid: game["id"]}
      @results << game_hash
    end
    @product_offer = ProductOffer.new
    render :new
  end

  def create
    if find_product_with_gid
      @product = Product.find_by(gid: params["product_offer"]["gid"].to_i)
    else
      new_product = search_api(params["product_offer"]["gid"].to_i)
      @product = Product.create(new_product)
    end


    @user = current_user

    @new_product_offer = ProductOffer.new(product_offer_params)
    @new_product_offer.user = @user
    @new_product_offer.product = @product
    #// @new_product_offer.product - currently being asked to user to input as a integer
    if @new_product_offer.save
      redirect_to product_path(@new_product_offer.product_id)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @product_offer =ProductOffer.find(params[:id])
    @product_offer.destroy
  end

private
  def product_offer_params
    params.require(:product_offer).permit(:price, :location, :product_id, :gid)
  end

  # def stronger_params
  #   pa = product_offer_params
  #   params[{price: pa[:price], location: pa[:location], product_id: pa[:product_id]}]
  # end

  def find_product_with_gid
    Product.exists?(gid: params["product_offer"]["gid"].to_i)
  end

  def search_api(gid)
    url = "https://igdbcom-internet-game-database-v1.p.mashape.com/games/#{gid}?fields=*"
    @result = Unirest.get url,
      headers:{
        "X-Mashape-Key" => ENV["x_mashape_key"],
        "Accept" => "application/json"
      }
    @result = @result.body.first
    @result["cover"].nil? ? game_cover_url = "http://placehold.it/300x500" : game_cover_url = @result["cover"]["url"]
    @result["release_dates"].nil? ? release_date = "Unknown" : release_date = @result["release_dates"].first["y"]

    @game_hash = {name: @result["name"], cover_url: game_cover_url, release_year: release_date, gid: @result["id"]}
  end

end
