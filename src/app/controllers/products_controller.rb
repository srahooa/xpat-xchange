class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy] 

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
  end

  def create
    # product = Product.new(product_params)
    # if product.save
    #   flash[:alert] = "Your product has been posted."
    #   redirect_to products_path
    # else
    #   flash[:alert] = product.errors.full_messages.join
    #   redirect_to new_product_path
    # end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:product_name, :origin_country, :voltage, :plug_type, :condition, :current_country, :current_city, :price)
  end
end