class PurchasesController < ApplicationController
  def index 
    @product = Product.find(params[:product_id])
    @user_purchase = UserPurchase.new
  end

  def create
    binding.pry
    @user_purchase = UserPurchase.new(purchase_params)
    if @user_purchase.valid?
      @user_purchase.save
      redirect_to "products#index"
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:user_purchase).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :tel_number).merge(user_id: current_user.id, product_id: params[:product_id])
  end

end
