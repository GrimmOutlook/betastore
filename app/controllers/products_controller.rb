class ProductsController < ApplicationController
  skip_before_filter :require_log_in

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
   @products = Product.all
   session[:view_count] ||=0
   session[:view_count] += 1


     respond_to do |format|
      format.html
      format.rss
      format.json do
        render json: @products
      end
    end
  end



  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

def create
  @product = Product.new(product_params)

  respond_to do |format|
    if @product.save
      format.html do
        redirect_to product_path(@product), notice: 'Product was saved'
      end 
      format.json do
        render json: @product
      end
    else
      format.html do
        render 'edit'
      end
      format.json do
        render json: {errors: @product.errors}, status: 422
      end
    end
  end
end

private
def product_params
  params.require(:product).permit(:name, :price)
end

def set_product
  @product = Product.find(params[:id])
end

 
end