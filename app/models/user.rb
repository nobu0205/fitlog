class User < ApplicationRecord
  has_many :workouts, dependent: :destroy

  validates :nickname, presence: true, length: { maximum: 20 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 
end
