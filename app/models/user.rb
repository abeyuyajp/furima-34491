class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
    validates :password_confirmation, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
    validates :family_name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :family_name_kana, format: {with: /\A[ァ-ヶー－]+\z/}
    validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/}
    validates :birth_day
  end

  #with_options presence: true, format: {with: /\A[a-zA-Z0-9]+\z/, message: "半角英数字で入力してください"} do
  #validates :encrypted_password
  

  #format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で入力してください"} do
    

   #format: {with: /\A[ァ-ヶー－]+\z/, message: "カタカナで入力してください"} do
    




end
