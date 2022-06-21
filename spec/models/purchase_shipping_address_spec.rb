require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  describe '商品購入' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order = FactoryBot.build(:purchase_shipping_address, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '入力情報に問題がない場合' do
      it 'すべての情報が正しく入力されているとき' do
        expect(@order).to be_valid
      end
      it '建物名が空欄であるとき' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end

    context '入力情報に問題がある場合' do
      it 'tokenが生成されていないとき' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号がないとき' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '都道府県がないとき' do
        @order.prefecture = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村がないとき' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it '番地がないとき' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号がないとき' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
    end

  end

end
