class Post < ApplicationRecord
  belongs_to :user
  has_many :replies, dependent: :destroy
  validates :description, presence: true
  validates :title, presence: true
end
