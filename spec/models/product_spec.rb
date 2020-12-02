require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品' do
    context '商品出品が上手くいくとき' do
      it 'name、content、category_id、status_id、ship_cost_id、prefecture_id、day_to_get_id、priceがあれば登録できる' do
        expect(@product).to be_valid
      end
      it 'priceが300円~9,999,999円の時登録できる' do
        @product.price = 500
        expect(@product).to be_valid
        ## expect(@product.valid?).to eq true
      end
    end
    context '商品出品がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと登録できない' do
        @product.name = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it 'contentが空だと登録できない' do
        @product.content = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Content can't be blank")
      end
      it 'category_idが1だと登録できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be --")
      end
      it 'statu_idが1だと登録できない' do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Status can't be --")
      end
      it 'ship_cost_idが1だと登録できない' do
        @product.ship_cost_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Ship cost can't be --")
      end
      it 'prefecture_idが1だと登録できない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be --")
      end
      it 'day_to_get_idが1だと登録できない' do
        @product.day_to_get_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Day to get can't be --")
      end
      it 'priceが空だと登録できない' do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299円以下だと登録できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include('Price out of setting')
      end
      it 'priceが10,000,000円以上だと登録できない' do
        @product.price = 10, 0o00, 0o00
        @product.valid?
        expect(@product.errors.full_messages).to include('Price out of setting')
      end
      it 'priceが全角だと登録できない' do
        @product.price = '１０００'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price out of setting')
      end
    end
  end
end
