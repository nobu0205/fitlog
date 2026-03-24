class CardioRecord < ApplicationRecord
  belongs_to :workout
  belongs_to :exercise

  validates :exercise_id, presence: true
end
