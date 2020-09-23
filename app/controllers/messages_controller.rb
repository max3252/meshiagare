class MessagesController < ApplicationController
  def new
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message = Message.new(text: params[:message][:text], user_id: current_user.id)
    ActionCable.server.broadcast 'message_channel', content: @message, username: @message.user.nickname if @message.save
  end
end
