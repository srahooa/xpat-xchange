require 'stripe'

class OrdersController < ApplicationController
  def index
    @orders = Order.all
    unless current_user.has_role? :admin
      redirect_to root_path
    end
  end

  def new
    @product = Product.find(params[:product_id])

    Stripe.api_key = Rails.application.credentials.dig(:stripe, :api_key)
  
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @product.product_name,
        description: "Current Location #{@product.current_city}",
        images: [],
        amount: (@product.price * 100).to_i,
        currency: "aud",
        quantity: 1  
      }],
      success_url: "#{root_url}/orders/complete",
      # success_url: "#{env[PORT] ? 'https://heroku-site' : 'http://localhost:300'}/orders/complete",
      cancel_url: "#{root_url}/orders/cancel",
    )
  end

  def complete
    flash[:alert] = "Your order has been completed. Items will ship shortly."
    redirect_to products_path
  
    # flash[:alert] = @order.errors.full_messages.join
    # redirect_to new_order_path  
  end

 

  private 

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:user_id)
  end
end
