FactoryBot.define do
  factory :item do
    title                { Faker::Lorem.sentence }
    category_id          { 2 }
    summary              { Faker::Lorem.sentence }
    condition_id         { 2 }
    shipping_id          { 2 }
    prefecture_id        { 2 }
    delivery_time_id     { 2 }
    price                { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
