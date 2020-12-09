class Message < ApplicationRecord

  validates :email, presence:true
  validates :message, presence:true

  belongs_to :user

end
