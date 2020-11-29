class PurchasesController < ApplicationController
  def index 
    @user_purchase = UserPurchase.new
  end

  def create
  
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
    params.require(:user_purchase).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :tel_number).merge(purchase_id: purchase_id)
  end

end
