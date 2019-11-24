class StatusUpdaterJob < ApplicationJob
  queue_as :default

  def perform(user)
    user_status = user.is_online? ? "Online" : "Offline"
    ActionCable.server.broadcast "user_status_#{user.id}", { status: user_status }
  end
end
