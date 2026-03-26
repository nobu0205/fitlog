class Exercise < ApplicationRecord
  belongs_to :user, optional: true

  has_many :strength_records
  has_many :cardio_records
  enum exercise_type: { strength: 0, cardio: 1 }

  validates :muscle_group, presence: true
end
