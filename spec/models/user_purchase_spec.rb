require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  before do
    @user_purchase = FactoryBot.build(:user_purchase)
  end

  describe '配送先情報の保存' do
    context '保存が上手くいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user_purchase).to be_valid
      end
    end
    context '保存が上手くいかないとき' do
      it 'postal_codeが空だと保存できないこと' do
        @user_purchase.postal_code = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @user_purchase.postal_code = '1234567'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが1だと登録できないこと' do
        @user_purchase.prefecture_id = 1
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Prefecture can't be --")
      end
      it 'cityが空だと保存できないこと' do
        @user_purchase.city = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @user_purchase.house_number = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("House number can't be blank")
      end
      it 'buildingは空でも保存できること' do
        @user_purchase.building = nil
        expect(@user_purchase).to be_valid
      end
      it 'tel_numberが空だと保存できないこと' do
        @user_purchase.tel_number = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Tel number can't be blank")
      end
      it 'tel_numberにハイフンがあると保存できないこと' do
        @user_purchase.tel_number = '090-1234-5678'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Tel number input only half-width number')
      end
      it 'tel_numberが全角だと保存できないこと' do
        @user_purchase.tel_number = '０９０１２３４５６７８'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Tel number input only half-width number')
      end
      it 'tokenが空だと登録できないこと' do
        @user_purchase.token = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
