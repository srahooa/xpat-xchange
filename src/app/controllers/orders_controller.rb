require 'stripe'

class OrdersController < ApplicationController
  
  # was going to set up a view for admin of all orders. Future task.

  # def index
  #   @orders = Order.all
  #   unless current_user.has_role? :admin
  #     redirect_to root_path
  #   end
  # end

  # creating an order
  def new
    @product = Product.find(params[:product_id])

    # product payment via stripe!
    Stripe.api_key = Rails.application.credentials.dig(:stripe, :api_key)
  
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      # details to be present at checkout
      line_items: [{
        name: @product.product_name,
        description: "Current Location #{@product.current_city}",
        images: [],
        amount: (@product.price * 100).to_i,
        currency: "aud",
        quantity: 1  
      }],

      success_url: "#{root_url}/orders/complete",
      cancel_url: "#{root_url}/orders/cancel",
    )
  end

  # what happens after a payment is succesfully completed
  def complete
    flash[:alert] = "Your order has been completed. Items will ship shortly."
    redirect_to products_path
  
    # flash[:alert] = @order.errors.full_messages.join
    # redirect_to new_order_path  
  end

 

  private 

  # Callbacks for common constraints
  def set_order
    @order = Order.find(params[:id])
  end

  # data required to create order
  def order_params
    params.require(:order).permit(:user_id)
  end
end
