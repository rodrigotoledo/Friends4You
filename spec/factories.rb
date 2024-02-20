FactoryBot.define do
  factory :user do
    name { Faker::Name.name_with_middle }
    email { Faker::Internet.email }
    latitude { Random.number(99) }
    longitude { Random.number(99) }
    visiting_now { false }
  end
end
