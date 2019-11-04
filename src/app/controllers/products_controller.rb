class ProductsController < ApplicationController
  # before_action :authenticate_user! [ :create, :new, :update, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy] 
  before_action :authorise, only: [:edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      flash[:alert] = "Your product has been posted for sale."
      redirect_to product_path(@product)
    else
      flash[:alert] = @product.errors.full_messages.join
      redirect_to new_product_path
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
    @product = Product.find(params[:id]) 
  end

  def update
    @product.update(product_params)
    redirect_to product_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:product_name, :origin_country, :voltage, :plug_type, :condition, :current_country, :current_city, :price)
  end
end