class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
