class TimesheetsController < ApplicationController
  def index
    @timesheets = Timesheet.all
  end

  def show
    @timesheet = Timesheet.find(params[:id])
  end

  def new
    @timesheet = Timesheet.new
  end

  def create
    @timesheet = Timesheet.new(timesheet_params)
    @timesheet.user = current_user
    if @timesheet.save
      redirect_to timesheet_path(@timesheet)
    else
      render :new
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
