require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できるとき' do
      it 'title、category、summary、condition、shipping、prefecture、delivery_time、price、imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      it 'titleが空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it 'summaryが空では登録できない' do
        @item.summary = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Summary can't be blank")
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'image無しでは登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it 'category_idが1では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category は必ず選択してください')
      end

      it 'condition_idが1では登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition は必ず選択してください')
      end

      it 'shipping_idが1では登録できない' do
        @item.shipping_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping は必ず選択してください')
      end

      it 'prefecture_idが1では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture は必ず選択してください')
      end

      it 'delivery_time_idが1では登録できない' do
        @item.delivery_time_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery time は必ず選択してください')
      end

      it 'Priceは300円から9,999,999円までの金額で半角数字でないと登録できない' do
        @item.price = '３３３ａa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300円から9,999,999円までの金額を半角数字で入力してください')
      end

      it 'Priceは299円以下の場合登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300円から9,999,999円までの金額を半角数字で入力してください')
      end

      it 'Priceは10,000,000円以上の場合登録できない' do
        @item.price = '10_000_000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300円から9,999,999円までの金額を半角数字で入力してください')
      end
    end
  end
end
