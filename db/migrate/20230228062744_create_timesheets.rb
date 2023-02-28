class CreateTimesheets < ActiveRecord::Migration[7.0]
  def change
    create_table :timesheets do |t|
      t.datetime :time_in
      t.datetime :time_out
      t.string :attendance
      t.string :comment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
