FactoryBot.define do
  factory :item do
    Faker::Config.locale = 'ja'

    item_name           { Faker::Book.title }
    explanation         { Faker::String.random(length: 1..1000) }
    category_id         { Faker::Number.within(range: 2..11) }
    condition_id        { Faker::Number.within(range: 2..7) }
    shipping_cost_id    { Faker::Number.within(range: 2..3) }
    prefecture_id       { Faker::Number.within(range: 2..48) }
    days_to_ship_id     { Faker::Number.within(range: 2..4) }
    price               { Faker::Number.within(range: 300..9_999_999) }

    association :user

    after(:build) do |i|
      i.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
