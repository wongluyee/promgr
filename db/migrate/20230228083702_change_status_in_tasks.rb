class ChangeStatusInTasks < ActiveRecord::Migration[7.0]
  def change
    change_column_default :tasks, :status, to: "In Progress", from: "in_progress"
  end
end
