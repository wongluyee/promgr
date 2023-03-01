class UsersController < ApplicationController
  def index
    @users = policy_scope(User)
    authorize @users
  end
end
