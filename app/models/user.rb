class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true

  has_and_belongs_to_many :preferences, class_name: 'ActivityType', join_table: :user_preferences
  has_many :goals, dependent: :destroy

  accepts_nested_attributes_for :preferences  # If you need nested attributes for user preferences

  def admin?
    is_admin
  end
end