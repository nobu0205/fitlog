class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @workouts = @user.workouts.includes(:strength_records, :cardio_records)

    daily_totals = {}

    Workout.includes(:strength_records, :cardio_records, :user).find_each do |workout|
      key = [workout.user_id, workout.date]

      total = workout.strength_records.sum { |sr| sr.calories.to_f } +
              workout.cardio_records.sum { |cr| cr.calories.to_f }

      if daily_totals[key]
        daily_totals[key][:calories] += total
      else
        daily_totals[key] = {
          user: workout.user,
          date: workout.date,
          calories: total
        }
      end
    end

    @daily_ranking = daily_totals.values
                                 .sort_by { |d| d[:calories] }
                                 .reverse
                                 .first(5)
  end
end