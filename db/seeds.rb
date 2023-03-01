# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'date'

puts 'Cleaning the DB..'
UserTask.destroy_all
Task.destroy_all
Timesheet.destroy_all
Goal.destroy_all
User.destroy_all

puts 'Creating  users...'
users = []

User.create!(
  name: "Mehdi",
  email: "elmehdi@ben.com",
  job_title: "Manager",
  password: "12345678",
  is_manager: true
)

User.create!(
  name: "Luyee",
  email: "luyee@wong.com",
  job_title: "Frontend Dev",
  password: "12345678",
  is_manager: false
)

User.create!(
  name: "Josh",
  email: "josh@ng.com",
  job_title: "Backend Dev",
  password: "12345678",
  is_manager: false
)

User.create!(
  name: "Joe",
  email: "joe@luc.com",
  job_title: "Lead Dev",
  password: "12345678",
  is_manager: false
)

users << User.where(is_manager: false)
# user = users.sample

puts 'Creating tasks...'
tasks = []
Task.create!(
  task_title: "Finish the project",
  description: "Finish the project and push to Heroku by the end of the week",
  priority: "High",
  due_date: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 31, format: :short),
  status: "In Progress"
)
Task.create!(
  task_title: "Code the home page",
  description: "Code the home page according to the wireframe",
  priority: "Medium",
  due_date: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 31, format: :short),
  status: "In Progress"
)
Task.create!(
  task_title: "Code the about page",
  description: "Code the about page according to the wireframe",
  priority: "Medium",
  due_date: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 31, format: :short),
  status: "Done"
)
Task.create!(
  task_title: "Design the logo",
  description: "Design the logo for the website",
  priority: "High",
  due_date: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 31, format: :short),
  status: "In Progress"
)
Task.create!(
  task_title: "Design the wireframe",
  description: "Design the wireframe for the TeamLab website",
  priority: "High",
  due_date: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 31, format: :short),
  status: "In Progress"
)
tasks << Task.all

puts 'Creating user tasks...'
5.times do
  UserTask.create!(
    user: User.where(is_manager: false).sample,
    task: Task.all.sample
  )
end

puts 'Creating timesheets...'
User.all.each do |user|
  31.times do |index|
    day = index + 1
    Timesheet.create!(
      user: user,
      attendance: "working",
      comment: "Working on the project",
      time_in: DateTime.parse("#{day} Mar 2023 09:#{rand(0...15)}:00"),
      time_out: DateTime.parse("#{day} Mar 2023 18:#{rand(0...30)}:00")
    )
  end
end

puts 'Creating goals...'
Goal.create!(
  user: User.find_by(name: "Luyee"),
  title: "Increase Productivity",
  description: "Increase productivity by 20% by the end of March.",
  status: "in_progress"
)
Goal.create!(
  user: User.find_by(name: "Josh"),
  title: "Recruit and train",
  description: "Recruit a new member to my engineering team and train them to the point
  that their performance is satisfactory within the next three months",
  status: "in_progress"
)
Goal.create!(
  user: User.find_by(name: "Joe"),
  title: "Increase income",
  description: "To increase the net income by 10% through SEO and ads by the end of the third quarter.",
  status: "in_progress"
)
# Goal.create!(
#   user: users[3],
#   title: "Lean Development Methodology",
#   description: "Master the lean development methodology in order to eliminate common development challenges",
#   status: "in_progress"
# )
# Goal.create!(
#   user: users[4],
#   title: "Increase time efficiency",
#   description: "Increase number of tasks completed by 20% and reduce overtime by 10% by the end of the year.",
#   status: "in_progress"
# )

puts "... created #{User.count} users, #{Task.count} tasks, #{UserTask.count} tasks for users,
#{Timesheet.count} timesheets, and #{Goal.count} goals."
