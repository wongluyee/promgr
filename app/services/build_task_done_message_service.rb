class BuildTaskDoneMessageService
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
          "text": ":fireworks: *Task Completed!*\n*#{task.task_title} marked as done,*\n\nContact your manager if you have any questions.\n\n<https://www.promgr.tech/tasks|View tasks calendar>"
        }
      }
    ]
  end
end
