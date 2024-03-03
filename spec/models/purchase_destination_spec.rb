require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_destination = FactoryBot.build(:purchase_destination, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '購入できる場合' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@purchase_destination).to be_valid
      end

      it 'building_nameが空でも購入できる' do
        @purchase_destination.building_name = ''
        expect(@purchase_destination).to be_valid
      end
    end

    context '購入できない場合' do
      it 'postal_codeが空では購入できない' do
        @purchase_destination.postal_code = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが全角文字列だと保存できない' do
        @purchase_destination.postal_code = '１２３－４５６７'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Postal code は「3桁ハイフン4桁」の半角文字列で入力してください')
      end

      it 'postal_codeがハイフン無しの数字のみだと保存できない' do
        @purchase_destination.postal_code = '1234567'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Postal code は「3桁ハイフン4桁」の半角文字列で入力してください')
      end

      it 'prefecture_idが1では登録できない' do
        @purchase_destination.prefecture_id = '1'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Prefecture は必ず選択してください')
      end

      it 'municipalityが空では購入できない' do
        @purchase_destination.municipality = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'block_numberが空では購入できない' do
        @purchase_destination.block_number = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Block number can't be blank")
      end

      it 'phone_numberが空では購入できない' do
        @purchase_destination.phone_number = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberはハイフンがあると保存できない' do
        @purchase_destination.phone_number = '123-4567-8912'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Phone number はハイフンを入れずに、10桁以上11桁以内の半角数値で入力してください')
      end

      it 'phone_numberは10桁未満だと保存できない' do
        @purchase_destination.phone_number = '123456789'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Phone number はハイフンを入れずに、10桁以上11桁以内の半角数値で入力してください')
      end

      it 'phone_numberは12桁以上だと保存できない' do
        @purchase_destination.phone_number = '123456789123'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Phone number はハイフンを入れずに、10桁以上11桁以内の半角数値で入力してください')
      end

      it 'tokenが空では購入できない' do
        @purchase_destination.token = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_id（購入者）が空だと購入できない' do
        @purchase_destination.user_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("User can't be blank")
      end

      it 'item_id（購入商品）が空だと購入できない' do
        @purchase_destination.item_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
