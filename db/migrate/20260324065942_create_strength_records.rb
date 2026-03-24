class CreateStrengthRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :strength_records do |t|
      t.references :workout, null: false, foreign_key: true
      t.references :exercise, null: false, foreign_key: true
      t.integer :weight
      t.integer :reps
      t.integer :sets
      t.integer :duration
      t.integer :calories

      t.timestamps
    end
  end
end
