class Task < ApplicationRecord
  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks
  enum status: { in_progress: "In Progress", done: "Done" }

  validates :task_title, presence: true
  validates :due_date, presence: true
end
