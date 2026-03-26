class Workout < ApplicationRecord
  belongs_to :user
  has_many :strength_records, dependent: :destroy
  has_many :cardio_records, dependent: :destroy

  validates :date, presence: true
  
  accepts_nested_attributes_for :strength_records, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :cardio_records, allow_destroy: true, reject_if: :all_blank

  def total_calories
  strength_records.sum(:calories).to_f + cardio_records.sum(:calories).to_f
  end
end
