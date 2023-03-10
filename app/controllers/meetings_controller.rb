class MeetingsController < ApplicationController
  def index
    @meetings = policy_scope(Meeting)
    @user = current_user
  end

  def create
    @meeting = Meeting.new(meeting_params)
    authorize @meeting

    if @meeting.save
      # SlackClient.client.chat_postMessage(channel: '#general', blocks: BuildSlackMessageService.new(@task).call)
      redirect_to users_path
    else
      render "users/dashboard", status: :unprocessable_entity, locals: { timesheet_new: Timesheet.new }
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(:task_title, :due_date, :start_time, :end_time, user_ids: [])
  end
end
