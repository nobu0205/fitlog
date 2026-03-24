class CreateCardioRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :cardio_records do |t|
      t.references :workout, null: false, foreign_key: true
      t.references :exercise, null: false, foreign_key: true
      t.float :speed
      t.integer :duration
      t.float :distance
      t.integer :calories

      t.timestamps
    end
  end
end
