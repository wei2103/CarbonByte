class Content < ApplicationRecord
    belongs_to :user
  
    validates :content_type, presence: true
    validates :content_link, presence: true
    validates :title, presence: true
    validates :description, presence: true

  end
  