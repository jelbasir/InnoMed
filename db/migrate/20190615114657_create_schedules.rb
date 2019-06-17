class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.integer :doctor_id

      t.timestamps
    end
    add_index :schedules, :doctor_id
  end
end
