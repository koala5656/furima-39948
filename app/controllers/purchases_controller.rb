class PurchasesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_item, only: [:index, :create]

	def index
		gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
		@purchase_destination = PurchaseDestination.new
	end

	def create
		@purchase_destination = PurchaseDestination.new(purchase_params)
		if @purchase_destination.valid?
      pay_item
			@purchase_destination.save
      redirect_to root_path
		else
			gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
			render :index, status: :unprocessable_entity
		end
	end

	private

	def purchase_params
		params.require(:purchase_destination).permit(:postal_code, :prefecture_id, :municipality, :block_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
	end

	def set_item
    @item = Item.find(params[:item_id])
		return if current_user.id != @item.user_id && @item.purchase.blank?
		redirect_to '/'
  end

	def pay_item
		Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPテスト秘密鍵
		Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
	end

end
