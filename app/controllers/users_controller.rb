class UsersController < ApplicationController

  def dashboard
    skip_authorization
    @users = policy_scope(User)
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @timesheets = @user.timesheets
    authorize @user
  end
end
