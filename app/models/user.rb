class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true

  has_and_belongs_to_many :preferences, -> { distinct }, class_name: 'ActivityType', join_table: :user_preferences
  validates_uniqueness_of :preferences
end
