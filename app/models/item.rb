class Item < ApplicationRecord
	extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
	belongs_to :condition
	belongs_to :shipping
	belongs_to :prefecture
	belongs_to :delivery_time

	#空の投稿を保存できないようにする
	validates :title, :summary, :price, presence: true

	#プルダウンの選択が「---」の時は保存できないようにする
  validates :category_id, :condition_id, :shipping_id, :prefecture_id, :delivery_time_id, numericality: { other_than: 1 }

	validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end
