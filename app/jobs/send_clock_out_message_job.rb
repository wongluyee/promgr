class SendClockOutMessageJob < ApplicationJob
  queue_as :default

  def perform
    message = BuildClockOutMessageService.new.call
    SendSlackMessageService.new(channel: '#general', message: message).call
  end
end
