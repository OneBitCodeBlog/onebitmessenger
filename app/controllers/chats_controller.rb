class ChatsController < ApplicationController
  def show
    @user = User.find(params[:id])
    @messages = Message.where(sender: current_user, receiver: @user)
                        .or(Message.where(sender: @user, receiver: current_user))
                        .order(:created_at)
  end
end
