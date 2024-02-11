FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
		last_name             {'ああ'}
		first_name            {'いい'}
		last_name_kana        {'アア'}
		first_name_kana       {'イイ'}
		birth_date            {Faker::Date.backward}
  end
end