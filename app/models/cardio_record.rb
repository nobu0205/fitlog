class CardioRecord < ApplicationRecord
  belongs_to :workout
  belongs_to :exercise

  delegate :user, to: :workout

  # 保存前に自動で消費カロリーを計算
  before_save :calculate_calories

  validates :exercise_id, presence: true
  validates :duration, numericality: { greater_than: 0 }, allow_blank: true
  validates :distance, numericality: { greater_than: 0 }, allow_blank: true
  validates :speed, numericality: { greater_than: 0 }, allow_blank: true

  private

  def calculate_calories
    return if duration.blank? || exercise.blank? || exercise.mets.blank? || user.blank? || user.weight.blank?

    # 消費カロリー計算式
    # METs × 体重(kg) × 時間(h) × 1.05
    self.calories = exercise.mets * user.weight * (duration / 60.0) * 1.05
  end
end
