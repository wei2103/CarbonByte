FactoryBot.define do
  factory :activity do
    carbon_emission { 100 }
    association :activity_type
    # Add any other attributes you need for your activity
  end
end
