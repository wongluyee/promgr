class ChatroomsController < ApplicationController
  def show
    @message = Message.new
    authorize @chatroom
  end
end
