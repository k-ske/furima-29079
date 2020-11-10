require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録が上手くいくとき' do
      it "nickname、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、birthdayがあれば登録できる" do
      end
      it "nicknameが10文字以下で登録できる" do
      end
      it "passwordが6文字以上で登録できる" do
      end

      it "nicknameが空だと登録できない" do
        @user.nickname = ""  # nicknameの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "nicknameが11文字以上であれば登録できない" do
      end
      it "emailが空では登録できない" do
        @user.email = ""  # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに@が含まれていなければ登録できない" do
      end
      it "重複したemailがある場合、登録できない" do
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下だと登録できない"
      end
      it "password_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messsage).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空だと登録できない"
      end
      it "first_nameが空だと登録できない"
      end
      it "last_name_kanaが空だと登録できない"
      end
      it "first_name_kanaが空だと登録できない"
      end
      it "birthdayが空だと登録できない"
      end
    end 
  end
end
