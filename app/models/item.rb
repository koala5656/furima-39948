class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :delivery_time
  has_one_attached :image

  belongs_to :user
  has_one :purchase

  # 空の投稿を保存できないようにする
  validates :title, :summary, :price, :image, presence: true

  # プルダウンの選択が「---」の時は保存できないようにする
  validates :category_id, :condition_id, :shipping_id, :prefecture_id, :delivery_time_id,
            numericality: { other_than: 1, message: 'は必ず選択してください' }

  validates :price,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: 'は300円から9,999,999円までの金額を半角数字で入力してください' }
end
