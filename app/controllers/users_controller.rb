class UsersController < ApplicationController
  def dashboard
    @users = User.all
    @user = current_user
  end
end
