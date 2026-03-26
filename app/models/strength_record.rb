class StrengthRecord < ApplicationRecord
  belongs_to :workout
  belongs_to :exercise

  delegate :user, to: :workout

  # 保存前に自動で消費カロリーを計算
  before_save :calculate_calories

  validates :exercise_id, presence: true
  validates :weight, numericality: { greater_than: 0 }, allow_blank: true
  validates :reps, numericality: { greater_than: 0 }, allow_blank: true
  validates :sets, numericality: { greater_than: 0 }, allow_blank: true
  validates :duration, numericality: { greater_than: 0 }, allow_blank: true

  private

def calculate_calories
  return if weight.blank? || reps.blank? || sets.blank?

  # 標準的な筋トレ消費カロリー計算式
  self.calories = (weight * reps * sets * 0.1).round(1)
end
end
