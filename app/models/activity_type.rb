class ActivityType < ApplicationRecord
  validates :category, inclusion: { in: %w[transport food energy] }

  has_and_belongs_to_many :users, class_name: 'User', join_table: :user_preferences
end
