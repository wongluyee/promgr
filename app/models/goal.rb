class Goal < ApplicationRecord
  enum status: [:incomplete, :in_progress, :complete]

  belongs_to :user
end
