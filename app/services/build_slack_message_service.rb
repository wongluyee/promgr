class BuildSlackMessageService
  attr_reader :task

  def initialize(task)
    @task = task
  end

  def call
    [
      {
        "type": "section",
        "text": {
          "type": "mrkdwn",
          "text": ":exclamation: *New task added*\n*Title: #{task.task_title}*\n#{task.due_date.strftime("%a %b %e at %l:%M %p")}"
        }
      },
      {
        "type": "section",
        "text": {
          "type": "mrkdwn",
          "text": "#{task.users.pluck(:name).join(', ')} please check the task details and contact your manager if you have any questions.\n\n<https://www.promgr.tech/dashboard|View task details>"
        }
      }
    ]
  end
end
