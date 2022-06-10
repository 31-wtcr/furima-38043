FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    last_name             { Gimei.last.kanji }
    first_name            { Gimei.first.kanji }
    last_name_katakana    { Gimei.last.katakana }
    first_name_katakana   { Gimei.first.katakana }
    birthday              { Faker::Date.between(from: '1930-01-01', to: Date.today) }
  end
end
