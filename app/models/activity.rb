class Activity < ApplicationRecord
  belongs_to :activity_type, foreign_key: "type_id"
  belongs_to :user
end
