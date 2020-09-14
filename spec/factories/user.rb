FactoryBot.define do
  factory :user do
    nickname { 'tanaka' }
    email { 'ttt@gmail.com' }
    password { 'abc123' }
    password_confirmation { password }
    prefecture_id { 2 }
    gender_id { 2 }
    age_id { 2 }
    allergies { '卵' }
  end
end
