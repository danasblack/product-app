class OrdersController < ApplicationController
  def create
    @carted_product = current_user.carted_product.where(status: "carted")
    subtotal = 0
    @carted_product.each do |carted_product|
      product_total = carted_product.quantity * carted_product.produc_app.price
      subtotal = subtotal + product_total
  end
    quantity = params[:quantity]
    product = ProducApp.find_by(id: params[:product_id])
    subtotal = quantity.to_i * product.price
    tax = subtotal * 0.09
    total = subtotal + tax
   
    @order = Order.create(
      user_id: current_user.id, 
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    @carted_products.update_all(status: "purchased", order_id: order.id)

    flash[:success] = "Order successfully created"
    redirect_to "/orders/#{@order.id}" 
  end

  def show
  order_id = params[:id] 
  @order = Order.find_by(id: params[:id])
  render 'show.html.erb'
  end  
end


