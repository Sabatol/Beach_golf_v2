class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def participation_send
    UserMailer.participation_email(self).deliver_now
  end

end
