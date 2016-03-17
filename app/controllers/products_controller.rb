class ProductsController < ApplicationController
  def index
    @products = ProducApp.all
    sort_attribute = params[:sort]
    sort_descend = params[:sort_descend]
    sort_discount = params[:discount]
    if sort_attribute != nil
      @products = ProducApp.order(sort_attribute)
    elsif sort_descend != nil  
      @products = ProducApp.order(sort_descend => :desc)  
    elsif sort_discount != nil
      @products = ProducApp.where("#{sort_discount} < ?", 299)
    end  
     render "index.html.erb"
  end  
  
  def new
    render 'new.html.erb'
  end  

  def create
    ProducApp.create(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      image: params[:image]
      )
    redirect_to '/products/#{product.id}'
  end

  def show
    product_id = params[:id]
    @product = ProducApp.find_by(id: product_id)
    render 'show.html.erb'
  end

  def edit
    product_id = params[:id]
    @product = ProducApp.find_by(id: product_id)
    render 'edit.html.erb'
  end  
  
  def update
    product_id = params[:id]
    product = ProducApp(
     name: params[:name],
     price: params[:price],
     description: params[:description],
     image: params[:image]
     )
    flash[:success] = "Product successfully updated!"
    redirect_to '/products#{@product.id}'
  end 
  
  def destroy
    product_id = params[:id]
    @product = ProducApp.find_by(id: product_id)
    @product.destroy 
    flash[:warning] = "Product successfully deleted!"
    redirect_to '/products'
  end
end 

