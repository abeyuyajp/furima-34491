FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'a1' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {'阿部'}
    first_name            {'祐也'}
    family_name_kana      {'アベ'}
    first_name_kana       {'ユウヤ'}
    birth_day             {'1998-08-12'}
  end
end