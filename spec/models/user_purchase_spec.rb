require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  before do
    @user_purchase = FactoryBot.build(:user_purchase)
  end

  describe '配送先情報の保存' do
    context '保存が上手くいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
      end
    end
    context '保存が上手くいかないとき' do
      it 'postal_codeが空だと保存できないこと' do
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      end
      it 'prefectureを選択していないと保存できないこと' do
      end
      it 'cityは空でも保存できること' do
      end
      it 'house_numberは空でも保存できること' do
      end
      it 'building_nameは空でも保存できること' do
      end
      it 'priceが空だと保存できないこと' do
      end
      it 'priceが全角数字だと保存できないこと' do
      end
      it 'priceが1円未満では保存できないこと' do
      end
      it 'priceが1,000,000円を超過すると保存できないこと' do
      end
    end
  end
end
