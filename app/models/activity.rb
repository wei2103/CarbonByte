class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :activity_type
end
