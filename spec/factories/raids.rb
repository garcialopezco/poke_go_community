FactoryBot.define do
  factory :raid do
    gym { nil }
    boss { "MyString" }
    time { Time.current }
    remaining_time { 44 }
  end
end
