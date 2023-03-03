class ChangeColumnsDataTypeInTasks < ActiveRecord::Migration[7.0]
  def change
    change_column :tasks, :task_title, :string
    change_column :tasks, :description, :text
  end
end
