class BuildClockOutMessageService
  def call
    [
      {
        "type": "section",
        "text": {
          "type": "mrkdwn",
          "text": "Hey everyone, it's time to clock out."
        }
      },
      {
        "type": "actions",
        "block_id": "actionblock1",
        "elements": [
          {
            "type": "button",
            "text": {
              "type": "plain_text",
              "text": "Clock out now"
            },
            "style": "primary",
            "value": "clock_out"
          }
        ]
      }
    ]
  end
end
