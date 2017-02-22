class ProductsController < ApplicationController
  def index
    # // Got this from
    #  http://www.justinweiss.com/articles/search-and-filter-rails-models-without-bloating-your-controller/
    # I think it's not working because it's for active records
    @products = Product.where(nil) # creates an anonymous scope
    # @products = @products.genre(params[:genre]) if params[:genre].present?
    # @products = @products.location(params[:location]) if params[:location].present?
    @products = @products.starts_with(params[:starts_with]) if params[:starts_with].present?
  end



  def show
    @product = Product.find(params[:id])
  end
end
