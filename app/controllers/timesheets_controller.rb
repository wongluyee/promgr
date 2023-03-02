class TimesheetsController < ApplicationController
  def index
    @timesheets = policy_scope(Timesheet)
    authorize @timesheets
  end

  def show
    @timesheet = Timesheet.find(params[:id])
    authorize @timesheet
  end

  def new
    @timesheet = Timesheet.new
  end

  def create
    @user = User.find(params[:user_id])
    @timesheet = Timesheet.new(timesheet_params)
    @timesheet.user = current_user
    authorize @timesheet
    @timesheet.user = @user
    if @timesheet.save
      redirect_to @dashboard
    else
      render "users/dashboard", status: :unprocessable_entity
    end
  end

  def edit
    @timesheet = Timesheet.find(params[:id])
  end

  def update
    @timesheet = Timesheet.find(params[:id])
    @timesheet.update(timesheet_params)
    redirect_to timesheet_path(@timesheet)
  end

  private

  def timesheet_params
    params.require(:timesheet).permit(:time_in, :time_out, :attendance, :comment)
  end
end
