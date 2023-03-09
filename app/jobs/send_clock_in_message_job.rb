class SendClockInMessageJob < ApplicationJob
  queue_as :default

  def perform
    message = BuildClockInMessageService.new.call
    SendSlackMessageService.new(channel: '#general', message: message).call
  end
end
