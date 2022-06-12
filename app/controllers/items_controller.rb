class ItemsController < ApplicationController
  def index
  end

  def new
    unless user_signed_in?
      redirect_to new_user_session_path
    end

    @item = Item.new
  end

  private
  def items_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
