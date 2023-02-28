class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :job_title, :string
    add_column :users, :is_manager, :boolean
  end
end
