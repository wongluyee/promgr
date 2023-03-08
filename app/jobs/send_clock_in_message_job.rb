class SendClockInMessageJob < ApplicationJob
  queue_as :default

  def perform
    message = BuildSlackMessageService.new.clock_in_reminder
    SendSlackMessageService.new(channel: '#general', message: message).call
  end
end
