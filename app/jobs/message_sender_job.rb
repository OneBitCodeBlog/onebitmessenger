class MessageSenderJob < ApplicationJob
  queue_as :default

  def perform(message)
    MessageChannel.broadcast_to(message.receiver, render_partial(message))
  end

  private

  def render_partial(message)
    MessagesController.renderer.render partial: "messages/message", 
<<<<<<< HEAD
                                        locals: { message: message, current_user: message.receiver }
=======
                                      locals: { message: message, current_user: message.receiver }
>>>>>>> Recepção das mensagens
  end
end
