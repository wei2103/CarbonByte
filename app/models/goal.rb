class Goal < ApplicationRecord
  belongs_to :user
  
  validates :target_completion_date, presence: true
  validates :carbon_emission, presence: true
end
