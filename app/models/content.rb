class Content < ApplicationRecord
    belongs_to :user
  
    validates :content_type, presence: true
    validates :content_link, presence: true
    validates :title, presence: true
    validates :description, presence: true
    enum content_type: { video: 0, article: 1, infographic: 2 }
  end
  