# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'date'
require "open-uri"

puts 'Cleaning the DB...'
UserTask.destroy_all
Task.destroy_all
Timesheet.destroy_all
Goal.destroy_all
# Message.destroy_all
User.destroy_all
# Chatroom.destroy_all

puts 'Creating users...'
users = []

mehdi = User.new(
  name: "Mehdi",
  email: "elmehdi@ben.com",
  job_title: "Manager",
  password: "12345678",
  is_manager: true
)
  file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1673190740/pyp2lkzx5ec4awqextwq.jpg")
  mehdi.photo.attach(io: file, filename: "mehdi.jpg", content_type: "image/jpg")
  mehdi.save

josh = User.new(
  name: "Josh",
  email: "josh@ng.com",
  job_title: "Finance Associate",
  password: "12345678",
  is_manager: false
)
  file = URI.open("https://avatars.githubusercontent.com/u/97093935?v=4")
  josh.photo.attach(io: file, filename: "josh.jpg", content_type: "image/jpg")
  josh.save

joe = User.new(
  name: "Joe",
  email: "joe@luc.com",
  job_title: "Digital Marketing Specialist",
  password: "12345678",
  is_manager: false
)
  file = URI.open("https://avatars.githubusercontent.com/u/105550930?v=4")
  joe.photo.attach(io: file, filename: "joe.jpg", content_type: "image/jpg")
  joe.save

luyee = User.new(
  name: "Luyee",
  email: "luyee@wong.com",
  job_title: "Lead Accountant",
  password: "12345678",
  is_manager: false
)
file = URI.open("https://avatars.githubusercontent.com/u/111058709?v=4")
luyee.photo.attach(io: file, filename: "luyee.jpg", content_type: "image/jpg")
luyee.save

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
tasks = Task.all.shuffle
5.times do
  task = tasks.pop
  user = User.where(is_manager: false).sample
  UserTask.create!(
    user: user,
    task: task
  )
  UserTask.create!(
    user: User.where.not(id: user.id).sample,
    task: task
  )
end

puts 'Creating timesheets...'
today = Date.today
User.all.each do |user|
  date = today - 1
  until date == today - 30
    # 30.times do |index|
    # day = index + 1
    Timesheet.create!(
      user: user,
      attendance: "working",
      comment: "Working on the project",
      time_in: DateTime.parse("#{date} 09:#{rand(0...15)}:00"),
      time_out: DateTime.parse("#{date} 18:#{rand(0...30)}:00")
    )
    date -= 1
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

# puts "Creating chatroom..."
# Chatroom.create(name: "general")

puts "... created #{User.count} users, #{Task.count} tasks, #{UserTask.count} tasks for users,
#{Timesheet.count} timesheets, and #{Goal.count} goals."
