class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :category_id, :summary, :condition_id, :shipping_id, :prefecture_id, :delivery_time_id,
                                 :price, :image).merge(user_id: current_user.id)
  end
end
