class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
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

  private

  def product_params
    params.require(:product).permit(:name, :content, :price, :user, :image, :category_id, :status_id, :ship_cost_id, :prefecture_id, :day_to_get_id )
  end

end
