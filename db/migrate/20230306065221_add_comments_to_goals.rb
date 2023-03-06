class AddCommentsToGoals < ActiveRecord::Migration[7.0]
  def change
    add_column :goals, :comments, :text
  end
end
