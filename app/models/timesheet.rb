class Timesheet < ApplicationRecord
  belongs_to :user
  validates :time_in, presence: true
  enum attendance: { working: "Working", on_leave: "On leave" }
  # validates :time_out, presence: true
  # validates :attendance, presence: true
end
