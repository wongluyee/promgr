class ChangeIsManagerDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :is_manager, false
  end
end
