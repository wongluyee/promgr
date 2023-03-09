class BuildTimeoutMessageService
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
          "text": " #{@timesheet.user.name} logged out at #{@timesheet.time_out} "
        }
      }
    ]
  end
end
