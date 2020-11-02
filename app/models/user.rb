class User < ApplicationRecord
  has_many :events, through: :participations
end
