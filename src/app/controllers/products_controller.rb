class ProductsController < ApplicationController
  # actions to be done before anyother methods- 
  # set-product only for certain methods
  # authorise a user for certain methods

  before_action :set_product, only: [:show, :edit, :update, :destroy] 
  before_action :authorise, only: [:edit, :update, :destroy]

  # listing of all products
  def index
    @products = Product.all
  end


  def new
    @product = Product.new
  end

  # creation and saving of a new product
  def create
    @product = Product.new(product_params)
    @product.user = current_user
    @product.image.attach(product_params[:image])

    if @product.save
      flash[:alert] = "Your product has been posted for sale."
      redirect_to product_path(@product)
    else
      flash[:alert] = @product.errors.full_messages.join
      redirect_to new_product_path
    end
  end

  def edit
  end


  def show
  end

  # editing and saving
  def update
    @product.update(product_params)
    @product.image.attach(product_params[:image]) if product_params[:image]
    redirect_to product_path
  end

  # deletion of a product
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def authorise
    # if current_user == @product.user
    # flash[:alert] = "You are not authorised to perfrom that action!"
    # redirect_to products_path
    # end
  end

  # limits fields of data for a product. 
  def product_params
    params.require(:product).permit(:product_name, :origin_country, :voltage, :plug_type, :condition, :current_country, :current_city, :price, :image)
  end
end