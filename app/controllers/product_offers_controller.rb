class ProductOffersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @product_offer = ProductOffer.new
  end

  def create
    @user = current_user

    @new_product_offer = ProductOffer.new(product_offer_params)
    @new_product_offer.user =  @user
    #// @new_product_offer.product - currently being asked to user to input as a integer

    if @new_product_offer.save
      redirect_to product_product_offer_path(@new_product_offer)
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
