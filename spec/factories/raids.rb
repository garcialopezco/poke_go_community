FactoryBot.define do
  factory :raid do
    gym { nil }
    boss { "MyString" }
    level { 1 }
    time { Time.current }
    remaining_time { 44 }
  end
end
