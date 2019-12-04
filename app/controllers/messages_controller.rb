class MessagesController < ApplicationController
  def create
    @message = current_user.sent.build(receiver_id: params[:chat_id])
    @message.attributes = params.require(:message).permit(:content)
    @message.save
    render :create
  end
end
