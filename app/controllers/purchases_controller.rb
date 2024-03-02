class PurchasesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_item, only: [:index, :create]

	def index
		@purchase_destination = PurchaseDestination.new
	end

	def create
		@purchase_destination = PurchaseDestination.new(purchase_params)
		if @purchase_destination.valid?
			@purchase_destination.save
      redirect_to root_path
		else
			render :index, status: :unprocessable_entity
		end
	end

	private

	def purchase_params
		params.require(:purchase_destination).permit(:postal_code, :prefecture, :municipality, :block_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
	end

	def set_item
    @item = Item.find(params[:item_id])
  end

	# 削除
	# def destination_params
	# 	params.require(:destination).merge(purchase_id: @purchase.id)
	# end
end
