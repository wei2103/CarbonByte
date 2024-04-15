class Content < ApplicationRecord
    belongs_to :user
    has_one_attached :content_link

    validates :content_type, presence: true
    validates :content_link, presence: true
    validates :title, presence: true
    validates :description, presence: true

    def validate_content_type
      if content_link.attached? && !content_link.content_type.in?(%w(image/jpeg image/png video/mp4))
        errors.add(:content_link, 'must be a JPG, PNG, or MP4 file')
      end
    end
  end
  