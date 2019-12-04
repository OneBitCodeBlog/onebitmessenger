class Message < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"

  validates :content, presence: true

  after_create :send_message

  private

  def send_message
    MessageSenderJob.perform_now(self)
  end
end
