class UserMeeting < ApplicationRecord
  belongs_to :user
  belongs_to :meeting

  validates :user, presence: true
  validates :meeting, presence: true
end
