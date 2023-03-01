class UsersController < ApplicationController
  def dashboard
    @users = policy_scope(User)
    @user = current_user
  end
end
