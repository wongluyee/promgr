class ChangeTaskStatusDefault < ActiveRecord::Migration[7.0]
  def change
    change_column :tasks, :status, :string, default: "in_progress"
  end
end
