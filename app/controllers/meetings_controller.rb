class MeetingsController < ApplicationController
  def index
    @meetings = policy_scope(Meeting)
    @user = current_user
  end



  def create
    @meeting = Meeting.new(meeting_params)
    authorize @meeting

    if @task.save
      # SlackClient.client.chat_postMessage(channel: '#general', blocks: BuildSlackMessageService.new(@task).call)
      message = BuildSlackMessageService.new.call(@task)
      SendSlackMessageService.new(channel: '#tasks-notifications', message: message).call
      redirect_to users_path
    else
      render "users/dashboard", status: :unprocessable_entity, locals: { timesheet_new: Timesheet.new }
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(:title, :meeting_date, :start_time, :end_time)
  end

end
