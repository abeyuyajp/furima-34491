require 'rails_helper'

RSpec.describe PurchaseDeliveryAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_delivery_address = FactoryBot.build(:purchase_delivery_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '商品を購入できる時' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@purchase_delivery_address).to be_valid
      end
      it 'building_nameは空でも登録できる' do
        @purchase_delivery_address.building_name = ''
        expect(@purchase_delivery_address).to be_valid
      end
    end
    context '商品を購入できない時' do 
      it 'postal_codeが空だと保存できない' do
        @purchase_delivery_address.postal_code = ''
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Postal codeを入力してください")
      end
      it 'postal_codeは半角のハイフンを含んだ形式でないと保存できない' do
        @purchase_delivery_address.postal_code = '1234567'
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Postal codeは不正な値です")
      end
      it 'postal_codeは全角では保存できない' do
        @purchase_delivery_address.postal_code = '１２３ー４５６７'
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Postal codeは不正な値です")
      end
      it 'prefecture_idが空だと保存できない' do
        @purchase_delivery_address.prefecture_id = 1
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Prefectureは1以外の値にしてください")
      end
      it 'cityが空だと保存できない'do
        @purchase_delivery_address.city = ''
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Cityを入力してください")
      end
      it 'house_numberが空だと保存できない' do
        @purchase_delivery_address.house_number = ''
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("House numberを入力してください")
      end
      it 'phone_numberが空だと保存できない' do
        @purchase_delivery_address.phone_number = ''
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Phone numberを入力してください")
      end
      it 'phone_numberは11桁以内の数値のみ保存可能であること' do
        @purchase_delivery_address.phone_number = '090123456789'
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Phone numberは11文字以内で入力してください")
      end     
      it 'phone_numberは全角だと保存できない' do
        @purchase_delivery_address.phone_number = '０９０１２３４５６７８'
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Phone numberは不正な値です")
      end
      it 'phone_numberはハイフンが含まれていると保存できない' do
        @purchase_delivery_address.phone_number = '090-1234-56'
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Phone numberは不正な値です")
      end
    end
  end
end

  
