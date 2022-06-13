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
  end
end
