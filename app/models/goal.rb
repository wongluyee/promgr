class Goal < ApplicationRecord
  enum status: { met_target: "Target Achieved", fail_target: "Target Failed", over_target: "Target Overchieved", in_progress: "In Progress" }

  belongs_to :user
  validates :description, presence: true
  validates :title, presence: true
  validates :status, presence: true
end
