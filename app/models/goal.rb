class Goal < ApplicationRecord
  enum status: { met_target: "Target Achieved", fail_target: "Target Failed", over_target: "Target Overchieved" }
  belongs_to :user

end
