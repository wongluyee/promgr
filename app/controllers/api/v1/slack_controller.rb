class Api::V1::SlackController < ActionController::API
  def webhook
    # params coming from Slack
    payload = JSON.parse(params['payload'])
    puts "Payload from Slack:"
    p payload
    puts
    # Add a migration for slack info for user
    # Find user with their name
    user = User.find_by(slack_name: payload['user']['name'])
    # Find the timesheet for today for the user
    timesheet = user.timesheets.find_by(time_in: Date.today.all_day, user: user)
    if timesheet
      # update
      timesheet.update(time_out: DateTime.now)
    else
      Timesheet.create(user: user, time_in: DateTime.now)
    end
  end
end
