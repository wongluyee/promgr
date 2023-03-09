class BuildClockInMessageService
  def call
    [
      {
        "type": "section",
        "text": {
          "type": "mrkdwn",
          "text": "Good morning everyone. Remember to clock in."
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
              "text": "Clock in now"
            },
            "style": "primary",
            "value": "clock_in"
          }
        ]
      }
    ]
  end
end
