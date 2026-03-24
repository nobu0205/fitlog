class CreateWorkouts < ActiveRecord::Migration[7.1]
  def change
    create_table :workouts do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.integer :total_calories
      t.text :memo

      t.timestamps
    end
  end
end
