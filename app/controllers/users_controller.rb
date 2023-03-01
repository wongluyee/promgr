class UsersController < ApplicationController
  def dashboard
    @users = User.all
  end
end
