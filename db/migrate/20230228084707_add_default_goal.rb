class AddDefaultGoal < ActiveRecord::Migration[7.0]
  def change
    change_column_default :goals, :status, to: "In Progress", from: nil
  end
end
