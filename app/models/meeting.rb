class Meeting < ApplicationRecord
  has_many :user_meetings, dependent: :destroy
  has_many :users, through: :user_meetings

  validates :task_title, presence: true
  validates :due_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
