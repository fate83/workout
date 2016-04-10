class CreateExercises < ActiveRecord::Migration[5.0]
  def change
    create_table :exercises do |t|
      t.date :date
      t.integer :user_id
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
