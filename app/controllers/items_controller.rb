class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  
  def set_item
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.order(id: 'DESC')
  end

  def new
    @item = Item.new
    redirect_to new_user_session_path unless user_signed_in?
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    redirect_to new_user_session_path and return unless user_signed_in?
    redirect_to root_path and return if current_user != @item.user
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render 'edit'
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :condition_id, :shipping_cost_id, :prefecture_id,
                                 :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
