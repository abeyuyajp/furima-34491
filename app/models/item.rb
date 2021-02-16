class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipping_day

  with_options presence: true do
    validates :name
    validates :text
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :shipping_day_id
    end
    validates :price, format: {with:/\A[0-9]+\z/}
    #「販売価格は¥300~¥9,999,999の間のみ保存可能であること」に対する
    #バリデーションを記述
  end
end
