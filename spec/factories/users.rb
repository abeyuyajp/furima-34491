FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {'test'}
    first_name            {'test'}
    family_name_kana      {'テスト'}
    first_name_kana       {'テスト'}
    birth_day             {'1998-08-12'}
  end
end