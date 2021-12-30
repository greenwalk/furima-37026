require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できる場合' do
      it "全ての情報を入力したら出品できる" do
        expect(@item).to be_valid
      end
    end
    context '出品できない場合' do
      it "画像がないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "productが空では出品できない" do
        @item.product = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end
      it "instructionが空では出品できない" do
        @item.instruction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Instruction can't be blank")
      end
      it "categoryが空では出品できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "conditionが空では出品できない" do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "postageが空では出品できない" do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it "prefectureが空では出品できない" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "ship_periodが空では出品できない" do
        @item.ship_period_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship period can't be blank")
      end
      it "priceが空では出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが半角数字以外では出品できない" do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが300未満では出品できない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが9,999,999より大きいと出品できない" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "userがひもづいていないと出品できない" do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
