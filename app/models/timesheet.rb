class Timesheet < ApplicationRecord
  belongs_to :user
  validates :time_in, presence: true
  # validates :time_out, presence: true
  # validates :attendance, presence: true
end
