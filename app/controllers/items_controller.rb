class ItemsController < ApplicationController
  before_action :move_to_new, except: [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to '/'     
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :category, :summary, :condition, :shipping, :prefecture, :delivery_time, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_new
    unless user_signed_in?
      redirect_to user_session_path
    end
  end
end
