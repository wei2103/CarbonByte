FactoryBot.define do
  factory :goal do
    user { nil }
    target_completion_date { "2024-04-06" }
    carbon_emission { 1 }
  end
end
