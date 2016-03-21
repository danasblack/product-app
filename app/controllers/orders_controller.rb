class OrdersController < ApplicationController
  def create
    if current_user
      order = Order.create(
        quantity: params[:quantity],
        product_id: params[:product_id],
        user_id: current_user.id 
      )
      redirect_to "/orders/#{order.id}" 
    else
      redirect_to "/products"
    end
  end  
  
  def show
    order_id = params[:id] 
    @order = Order.find_by(id: order_id)
    render 'show.html.erb'
  end  
end
