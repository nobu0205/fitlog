class Workout < ApplicationRecord
  belongs_to :user
  has_many :strength_records, dependent: :destroy
  has_many :cardio_records, dependent: :destroy

  validates :date, presence: true
end
