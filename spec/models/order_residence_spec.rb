require 'rails_helper'

RSpec.describe OrderResidence, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_residence = FactoryBot.build(:order_residence, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_residence).to be_valid
      end
      it 'buildingが空でも保存できること' do
        @order_residence.building = ''
        expect(@order_residence).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できないこと' do
        @order_residence.post_code = ''
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号は「3桁ハイフン4桁」の半角文字列でなければ保存できないこと' do
        @order_residence.post_code = '1234567'
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefectureが空だと保存できないこと' do
        @order_residence.prefecture_id = 1
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと保存できないこと' do
        @order_residence.municipality = ''
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_residence.address = ''
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_residence.phone_number = ''
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberに半角数値以外が含まれると保存できないこと' do
        @order_residence.phone_number = '０１２３４５６７８９０'
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'phone_numberが9文字以下だと保存できないこと' do
        @order_residence.phone_number = '12345678'
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Phone number is too short")
      end
    end
  end
  
end
