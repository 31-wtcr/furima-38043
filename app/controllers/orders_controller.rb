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
    if @form.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
      @form.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def purchase_params
    params.require(:purchase_shipping_address).permit(:postal_code, :prefecture, :city, :address, :building_name, :phone_number ).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end
end
