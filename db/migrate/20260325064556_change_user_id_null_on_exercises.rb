class ChangeUserIdNullOnExercises < ActiveRecord::Migration[7.1]
  def change
    change_column_null :exercises, :user_id, true
  end
end
