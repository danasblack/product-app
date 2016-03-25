class OrdersController < ApplicationController
  def create
    quantity = params[:quantity]
    product = ProducApp.find_by(id: params[:product_id])
    subtotal = quantity.to_i * product.price
    tax = subtotal * 0.09
    total = subtotal + tax
    order = Order.create(
      quantity: params[:quantity],
      product_id: params[:product_id],
      user_id: current_user.id, 
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    @carted_product = current_user.carted_product.where(status: "carted")
    subtotal = 0

    @carted_product.each do |carted_product|
      product_total = carted_product.quantity * carted_product.product.price
      subtotal = subtotal + product_total
    end

    tax = subtotal * 0.09
    total = tax + subtotal

    order = Order.create(
      user_id: current_user.id, 
      subtotal: subtotal,
      tax: tax,
      total: total
    )

    flash[:success] = "Order successfully created"
    redirect_to "/orders/#{order.id}" 
  end
end  

def show
  order_id = params[:id] 
  @order = Order.find_by(id: order_id)
  render 'show.html.erb'
end  

