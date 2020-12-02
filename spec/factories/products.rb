FactoryBot.define do
  factory :product do
    name            { Faker::Lorem.sentence }
    content         { Faker::Lorem.sentence }
    image           { Faker::Lorem.sentence }
    category_id     { 2 }
    status_id       { 2 }
    ship_cost_id    { 2 }
    prefecture_id   { 2 }
    day_to_get_id   { 2 }
    price           { 500 }

    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
