class ChangeDueDateToMeetingDateInMeeting < ActiveRecord::Migration[7.0]
  def change
    rename_column :meetings, :meeting_date, :due_date
  end
end
