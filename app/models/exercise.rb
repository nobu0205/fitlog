class Exercise < ApplicationRecord
  belongs_to :user, optional: true

  has_many :strength_records
  has_many :cardio_records
end
