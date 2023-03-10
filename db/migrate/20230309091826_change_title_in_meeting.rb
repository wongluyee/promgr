class ChangeTitleInMeeting < ActiveRecord::Migration[7.0]
  def change
    rename_column :meetings, :title, :task_title
  end
end
