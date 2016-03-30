class CartedproductsController < ApplicationController
  def create
    if current_user
      quantity = params[:quantity]
      product = ProducApp.find_by(id: params[:product_id])
      subtotal = quantity.to_i * product.price
      tax = subtotal * 0.09
      total = subtotal + tax
      @carted_product = CartedProduct.create(
        quantity: params[:quantity],
        product_id: params[:product_id],
        user_id: current_user.id, 
        status: "carted"
      )
      flash[:success] = "Item added to cart"
      redirect_to '/cartedproducts' 
    else
      redirect_to "/products"
    end
  end
  
  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    render 'index.html.erb'
  end  
end