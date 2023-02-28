class TasksController < ApplicationController
  def index
    @tasks = Task.where(
      created_at: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week
    )
  end
end
