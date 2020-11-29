require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  before do
    @user_purchase = FactoryBot.build(:user_purchase)
  end

  describe '配送先情報の保存' do
    context '保存が上手くいくとき' do
      it "すべての値が正しく入力されていれば保存できること" do
        expect(@user_purchase).to be_valid
      end
    end
    context '保存が上手くいかないとき' do
      it "postal_codeが空だと保存できないこと" do
      end
      it "postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと" do
      end
      it "prefecture_idが1だと登録できないこと" do
      end
      it "cityが空だと保存できないこと" do
      end
      it "house_numbeが空だと保存できないこと" do
      end
      it "building_nameは空でも保存できること" do
      end
      it "tel_numberが空だと保存できないこと" do
      end
      it "tel_numberにハイフンがあると保存できないこと" do
      end
      it "tel_numberが全角だと保存できないこと" do
      end
    end
  end
end
