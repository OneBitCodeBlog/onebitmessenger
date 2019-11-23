class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :record, class_name: "User"
end
