class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password_confirmation, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
    with_options format: {with: /\A[ぁ-んァ-ン一-龥々]+\z/} do
      validates :family_name
      validates :first_name
    end
    with_options format: {with: /\A[ァ-ヶー－]+\z/} do
      validates :family_name_kana
      validates :first_name_kana
     end
    validates :birth_day
   end

    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}

    




end
