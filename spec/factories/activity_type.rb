FactoryBot.define do
  factory :activity_type do
    sequence(:name) { |n| "activity_type_#{n}" } # Generates unique name for each factory
    # Add any other attributes you need for your activity type
  end
end
