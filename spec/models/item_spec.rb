require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品の保存' do
    before do
      @item = FactoryBot.build(:item)
    end

      context '商品を出品できる時' do
        it '全ての情報があれば登録できる' do
          expect(@item).to be_valid
        end
      end
      context '商品を出品できない時' do
        it '商品画像を1枚つけることが必須' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Imageを入力してください")
        end
        it '商品名が空では出品できない' do
          @item.name = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Nameを入力してください")
        end
        it '商品の説明が空では出品できない' do
          @item.text =""
          @item.valid?
          expect(@item.errors.full_messages).to include("Textを入力してください")
        end
        it 'カテゴリーの情報が空では出品できない' do
          @item.category_id =""
          @item.valid?
          expect(@item.errors.full_messages).to include("Categoryを入力してください")
        end
        it '商品の状態についての情報が空では出品できない' do
          @item.condition_id =""
          @item.valid?
          expect(@item.errors.full_messages).to include("Conditionを入力してください")
        end
        it '配送料の負担についての情報が空では出品できない' do
          @item.delivery_fee_id =""
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery feeを入力してください")
        end
        it '発送元の地域についての情報が空では出品できない' do
          @item.prefecture_id =""
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefectureを入力してください")
        end
        it '発送までの日数についての情報が空では出品できない' do
          @item.shipping_day_id =""
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping dayを入力してください")
        end
        it '販売価格についての情報が空では出品できない' do
          @item.price =""
          @item.valid?
          expect(@item.errors.full_messages).to include("Priceを入力してください")
        end
        it '販売価格は半角英数字出なければ出品できない' do 
          @item.price = '２０００'
          @item.valid?
          expect(@item.errors.full_messages).to include("Priceは数値で入力してください")
        end
        it '販売価格は300円以上でなければ出品できない' do
          @item.price = '100'
          @item.valid?
          expect(@item.errors.full_messages).to include("Priceは300以上の値にしてください")
        end
        it '販売価格は9,999,999円以上でなければ出品できない' do
          @item.price = '100000000'
          @item.valid?
          expect(@item.errors.full_messages).to include("Priceは9999999以下の値にしてください")
        end
        it 'userが紐付いていないと出品できないこと' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Userを入力してください")
        end
      end
  end
end