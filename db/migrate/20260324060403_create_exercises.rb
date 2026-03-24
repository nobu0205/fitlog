class CreateExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :category
      t.integer :exercise_type
      t.float :mets
      t.boolean :is_custom
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
