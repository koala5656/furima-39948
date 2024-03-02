class PurchaseDestination
	include ActiveModel::Model
	attr_accessor :postal_code, :prefecture, :municipality, :block_number, :building_name, :phone_number, :user_id, :item_id

	# バリデーション
	with_options presence: true do
		validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は「3桁ハイフン4桁」の半角文字列で入力してください"}
		validates :municipality
		validates :block_number
		validates :building_name, allow_blank: true
		validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "はハイフンを入れずに、10桁以上11桁以内の半角数値で入力してください" }
		validates :user_id
		validates :item_id
	end

	validates :prefecture, numericality: { other_than: 1, message: 'は必ず選択してください' }

	# 各テーブルにデータを保存する処理
	def save
		purchase = Purchase.create(user_id: user_id, item_id: item_id)
		Destination.create(postal_code: postal_code, prefecture: prefecture, municipality: municipality, block_number: block_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
	end
end