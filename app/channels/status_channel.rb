class StatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from "user_status_#{params[:user]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
