class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:title, :category, :summary, :condition, :shipping, :prefecture, :delivery_time, :price, :image).merge(user_id: current_user.id)
  end
end
