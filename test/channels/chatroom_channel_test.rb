require "test_helper"

class ChatroomChannelTest < ActionCable::Channel::TestCase
  # test "subscribes" do
  #   subscribe
  #   assert subscription.confirmed?
  # end

  def subscribed
    chatroom = Chatroom.find(params[:id])
    stream_for chatroom
  end
end
