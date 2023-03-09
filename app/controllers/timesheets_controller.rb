class TimesheetsController < ApplicationController
  def index
    @timesheets = policy_scope(Timesheet)
    @my_timesheets = @current_user.timesheets
    authorize @timesheets
    authorize @my_timesheets
  end

  def show
    @timesheet = Timesheet.find(params[:id])
    authorize @timesheet
  end

  def new
    @timesheet = Timesheet.new
  end

  def create
    @timesheet = Timesheet.new
    @timesheet.attendance = "Working"
    @timesheet.time_in = DateTime.now
    @timesheet.user = current_user
    authorize @timesheet
    if @timesheet.save
      message = BuildSlackMessageService.new.timelog(@timesheet)
      SendSlackMessageService.new(channel: '#general', message: message).call
      redirect_to dashboard_path
    else
      render "users/dashboard", status: :unprocessable_entity
    end
  end

  def edit
    @timesheet = Timesheet.find(params[:id])
  end

  def update
    @timesheet = Timesheet.find(params[:id])
    @timesheet.time_out = DateTime.now
    @timesheet.update(timesheet_params)

    message = BuildSlackMessageService.new.timeout(@timesheet)
    SendSlackMessageService.new(channel: '#general', message: message).call

    authorize @timesheet
    redirect_to dashboard_path
  end

  private



  def timesheet_params
    params.require(:timesheet).permit(:time_in, :time_out)
  end
end
