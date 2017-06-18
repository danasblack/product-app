class OrdersController < ApplicationController
  def create
    @carted_products = current_user.carted_products.where(status: "carted")
    subtotal = 0
    @carted_products.each do |carted_product|
      quantity = carted_product.quantity
      price = carted_product.produc_app.price
      subtotal += quantity * price
    end
    tax = subtotal * 0.09
    total = subtotal + tax
   
    @order = Order.create(
      user_id: current_user.id, 
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    @carted_products.update_all(status: "purchased", order_id: @order.id)

    flash[:success] = "Order successfully created"
    redirect_to "/orders/#{@order.id}" 
  end

  def show
  order_id = params[:id] 
  @order = Order.find_by(id: params[:id])
  render 'show.html.erb'
  end  
end


