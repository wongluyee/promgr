class UsersController < ApplicationController

  def dashboard
    skip_authorization
    @users = policy_scope(User)
    @user = current_user
    @task = Task.new
  end
end
