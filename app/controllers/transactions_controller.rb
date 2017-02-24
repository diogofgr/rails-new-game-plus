class TransactionsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @transaction = Transaction.new
    @product_offer = find_product_offer
  end

  def create
    @transaction = Transaction.create(transaction_params)
  end

  private

  def find_product_offer
    ProductOffer.find(params["product_offer_id"])
  end

  def transaction_params
    params.require(:transaction).permit(:delivery_address, :return_address, :order_status, :buyer_id, :product_offer_id)
  end
end
