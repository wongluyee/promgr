class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.string :title
      t.date :meeting_date
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
