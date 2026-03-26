class AddMuscleGroupToExercises < ActiveRecord::Migration[7.1]
  def change
    add_column :exercises, :muscle_group, :string
  end
end
