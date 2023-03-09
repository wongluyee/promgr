class BuildTimelogMessageService
  attr_reader :timesheet

  def initialize(timesheet)
    @timesheet = timesheet
  end

  def call
    [
      {
        "type": "section",
        "text": {
          "type": "mrkdwn",
          "text": " #{@timesheet.user.name} logged in at #{@timesheet.time_in} "
        }
      }
    ]
  end
end
