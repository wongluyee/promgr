class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def dashboard
    # @users = policy_scope(User)
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    # authorize @user
  end
end
