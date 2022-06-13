require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品の出品' do
    context '商品の出品ができるとき' do
      it '必要な情報を満たせば商品の出品ができる' do
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができないとき' do
      it '画像が添付されていないので不可' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないので不可' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品説明がないので不可' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it '商品説明が1000文字を超えたので不可' do
        @item.explanation = Faker::String.random(length: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include('Explanation is too long (maximum is 1000 characters)')
      end
      it 'カテゴリーが選択されていないので不可' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が選択されていないので不可' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担が選択されていないので不可' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end
      it '発送元が選択されていないので不可' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数が選択されていないので不可' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it '価格が入力されていないので不可' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円未満で不可' do
        @item.price = Faker::Number.between(from: -10_000, to: 300)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格が10,000,000円以上で不可' do
        @item.price = Faker::Number.between(from: 10_000_000, to: 100_000_000)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
