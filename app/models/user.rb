class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :timesheets, dependent: :destroy
  has_many :goals, dependent: :destroy
  has_many :user_tasks, dependent: :destroy
  has_many :tasks, through: :user_tasks

  validates :name, presence: true
  validates :job_title, presence: true
  # validates :is_manager, presence: true
  with_options if: :is_manager? do |manager|
    manager.validates :name, presence: true
    manager.validates :job_title, presence: true
  end
end
