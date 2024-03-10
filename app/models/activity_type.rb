class ActivityType < ApplicationRecord
  validates :category, inclusion: { in: %w[transport food energy] }
  has_many :activities, foreign_key: "type_id"

  has_and_belongs_to_many :users, class_name: 'User', join_table: :user_preferences

  def as_json(options = {})
    super(only: [:id, :climatiq_unit_type, :climatiq_unit_of_measurement])
  end
end
