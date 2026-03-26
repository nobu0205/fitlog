class WorkoutsController < ApplicationController
  before_action :authenticate_user!

  def index
    @workouts = current_user.workouts.order(date: :desc)
  end

  def show
  @workout = current_user.workouts.find(params[:id])
  end

  def new
    @workout = Workout.new
    build_records
    
     @strength_exercises = Exercise.where(exercise_type: :strength)
     @cardio_exercises = Exercise.where(exercise_type: :cardio)
  end

  def create
    @workout = current_user.workouts.build(workout_params)
    if @workout.save
      redirect_to workouts_path, notice: "記録を保存しました"
    else
      @strength_exercises = Exercise.where(exercise_type: :strength)
      @cardio_exercises = Exercise.where(exercise_type: :cardio)
      build_records
      render :new
    end
  end
  def destroy
  workout = current_user.workouts.find(params[:id])
  workout.destroy
  redirect_to workouts_path, notice: "削除しました"
  end

  def edit
  @workout = current_user.workouts.find(params[:id])
  
  @workout.strength_records.build if @workout.strength_records.empty?
  @workout.cardio_records.build if @workout.cardio_records.empty?

  @strength_exercises = Exercise.where(exercise_type: :strength)
  @cardio_exercises = Exercise.where(exercise_type: :cardio)
  end

def update
  @workout = current_user.workouts.find(params[:id])
  if @workout.update(workout_params)
    redirect_to workouts_path, notice: "更新しました"
  else
    @strength_exercises = Exercise.strength
    @cardio_exercises = Exercise.cardio
    render :edit
  end
end

  private

  def build_records
  3.times { @workout.strength_records.build } if @workout.strength_records.empty?
  2.times { @workout.cardio_records.build } if @workout.cardio_records.empty?
  end

  def workout_params
  params.require(:workout).permit(
    :date,
    :memo,
    strength_records_attributes: [
      :id, :exercise_id, :weight, :reps, :sets, :duration, :_destroy
    ],
    cardio_records_attributes: [
      :id,:exercise_id, :speed, :duration, :distance, :_destroy
    ]
  )
  end
end