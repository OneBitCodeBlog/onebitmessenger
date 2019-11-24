class MessagesController < ApplicationController
  def create
    @message = current_user.sent.build(receiver_id: params[:chat_id])
    @message.attributes = message_params
    @message.save
    render :create
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
