Factory.define :user do |f|
  f.sequence(:name) { |n| "Fulano #{n}" }
  f.sequence(:email) { |n| "amigo#{n}@example.com" }
  f.latitude Random.number(99)
  f.longitude Random.number(99)
  f.visiting_now false
end