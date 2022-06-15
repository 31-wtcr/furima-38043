class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :user_match?, only: [:edit, :destroy]

  def set_item
    @item = Item.find(params[:id])
  end

  def user_match?
    redirect_to root_path if current_user != @item.user
  end

  def index
    @items = Item.order(id: 'DESC')
  end

  def new
    @item = Item.new
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
    redirect_to root_path if current_user != @item.user
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :condition_id, :shipping_cost_id, :prefecture_id,
                                 :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
