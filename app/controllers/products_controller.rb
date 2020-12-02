class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy if current_user.id == @product.user_id
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :content, :price, :image, :category_id, :status_id, :ship_cost_id, :prefecture_id, :day_to_get_id).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
