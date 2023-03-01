# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts 'Cleaning the DB..'
UserTask.destroy_all
Task.destroy_all
Timesheet.destroy_all
Goal.destroy_all
User.destroy_all

puts 'Creating  users...'
users = []
5.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    job_title: Faker::Job.title,
    password: "12345678"
  )
  users << user
end
# user = users.sample
puts 'Creating tasks...'
tasks = []
Task.create!(
  task_title: "Finish the project",
  description: "Finish the project and push to Heroku by the end of the week",
  priority: "High",
  due_date: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 31, format: :short),
  status: "incomplete",

)
Task.create!(
  task_title: "Code the home page",
  description: "Code the home page according to the wireframe",
  priority: "Medium",
  due_date: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 31, format: :short),
  status: "incomplete",

)
Task.create!(
  task_title: "Code the about page",
  description: "Code the about page according to the wireframe",
  priority: "Medium",
  due_date: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 31, format: :short),
  status: "copmleted",

)
Task.create!(
  task_title: "Design the logo",
  description: "Design the logo for the website",
  priority: "High",
  due_date: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 31, format: :short),
  status: "incomplete",

)
Task.create!(
  task_title: "Design the wireframe",
  description: "Design the wireframe for the TeamLab website",
  priority: "High",
  due_date: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 31, format: :short),
  status: "incomplete",

)
tasks << Task.all
puts 'Creating user tasks...'
5.times do
  UserTask.create!(
    user: users.sample,
    task: Task.all.sample
  )
end

puts 'Creating timesheets...'
User.all.foreach do |user|
  31.times do |index|
    Timesheet.create!(
      user: user,
      attendance: "working",
      comment: "Working on the project",
      time_in: DateTime.new(2023,2,index + 1,rand(7...10),rand(59),rand(59)),
      time_out: DateTime.new(2023,2,index + 1,rand(18...22),rand(59),rand(59))
    )
  end
end
# DateTime.new(2001,2,3,4,5,6)


puts 'Creating goals...'
Goal.create(
  user: users.sample,
  description: "Increase productivity by 20% by the end of March.",
  status: "in_progress"
)
Goal.create(
  user: users.sample,
  description: "Complete 5 tasks by the end of the week.",
  status: "in_progress"
)
Goal.create(
  user: users.sample,
  description: "To increase the net income by 10% by the end of the third quarter.",
  status: "in_progress"
)
Goal.create(
  user: users.sample,
  description: "To help 5 project managers pass the PMI-RMP® exam between August 1 and October 31 of 2023",
  status: "in_progress"
)
Goal.create(
  user: users.sample,
  description: "Increase number of tasks completed by 20% and reduce overtime by 10% by the end of the year.",
  status: "in_progress"
)

puts "... created #{User.count} users, #{Task.count} tasks, #{UserTask.count} tasks for users and
#{Timesheet.count} timesheets, and #{Goal.count} goals."
