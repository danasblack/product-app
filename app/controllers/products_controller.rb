class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show, :search]
  
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
    if params[:category]
      @products = Category.find_by(name: params[:category]).produc_apps
    end
    render "index.html.erb"
  end  
  
  def new
    @product = ProducApp.new
    render "new.html.erb"     
  end 

  def show
    products = ProducApp.all
    @product = products.sample
    product_id = params[:id]
    @product = ProducApp.find_by(id: product_id)
    render "show.html.erb"
  end

  def create
    @product = ProducApp.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      image: params[:image]
    )
    if @product.save
      flash[:success] = "Product made!"
      redirect_to '/products/#{product.id}'
    else
      render "new.html.erb"
    end
  end 

  def edit
    product_id = params[:id]
    @product = ProducApp.find_by(id: product_id)
    render "edit.html.erb"
  end  

  def update
    product_id = params[:id]
    if @prodducts.update(
     name: params[:name],
     price: params[:price],
     description: params[:description],
     image: params[:image]
    )
      flash[:success] = "Product successfully updated!"
      redirect_to '/products#{@product.id}'
    else
      render "edit.html.erb"
    end
  end 

  def destroy
    product_id = params[:id]
    @product = ProducApp.find_by(id: product_id)
    @product.destroy 
    flash[:warning] = "Product successfully deleted!"
    redirect_to "/products"
  end

  def run_search
    search_term = params[:search]
    @products = ProducApp.where('name LIKE ?', '%#{search_term}%')
    render "index.html.erb"
  end   

  def authenticate_admin!
    unless current_user && current_user.admin
      redirect_to "/"
    end  
  end 
end
