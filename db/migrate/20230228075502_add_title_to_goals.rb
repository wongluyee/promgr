class AddTitleToGoals < ActiveRecord::Migration[7.0]
  def change
    add_column :goals, :title, :string
  end
end
