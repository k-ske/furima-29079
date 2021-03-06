class PurchasesController < ApplicationController
  before_action :set_product, only: [:index, :create]
  before_action :move_to_root_path
  before_action :move_to_toppage
  before_action :move_to_top

  def index 
    @user_purchase = UserPurchase.new
  end

  def create
    @user_purchase = UserPurchase.new(purchase_params)
    if @user_purchase.valid?
      pay_product
      @user_purchase.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def move_to_root_path
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def move_to_toppage
    if current_user.id == @product.user_id
      redirect_to root_path
    end
  end

  def move_to_top
    if Purchase.exists?(product_id: @product.id) 
      redirect_to root_path
    end
  end
  

  def purchase_params
    params.require(:user_purchase).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :tel_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: Product.find(params[:product_id]).price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'
    )
  end
end
