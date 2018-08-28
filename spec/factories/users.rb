FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "NiaTrainer#{n}" }
    level { 40 }
    team  { "Instinct" }
    trainer_phone_number { "9511234567" }
    password { "1223456@bcd" }
    password_confirmation { "1223456@bcd" }
  end
end
