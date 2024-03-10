class ActivityType < ApplicationRecord
  validates :category, inclusion: { in: %w[transport food energy] }
end
