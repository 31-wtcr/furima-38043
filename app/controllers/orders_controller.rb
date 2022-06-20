class OrdersController < ApplicationController
  before_action :item_find, only: [:index, :create]

  def item_find
    @item = Item.find(params[:item_id])
  end

  def index
    @item = Item.find(params[:item_id])
    @form = PurchaseShippingAddress.new
  end

  def create
    @form = PurchaseShippingAddress.new(purchase_params)
    binding.pry
    
    if @form.valid?
      @form.save
    else
      render 'index'
    end
  end

  private
  def purchase_params
    params.require(:purchase_shipping_address).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number ).merge(user_id: current_user.id, item_id: @item.id)
  end
end
