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
require 'nokogiri'

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

josh = User.new(
  name: "Josh",
  slack_name: "joshuang_443",
  email: "josh@ng.com",
  job_title: "Manager",
  password: "12345678",
  is_manager: true
)
  file2 = URI.open("https://avatars.githubusercontent.com/u/97093935?v=4")
  josh.photo.attach(io: file2, filename: "josh.jpg", content_type: "image/jpg")
  josh.save

  mehdi = User.new(
    name: "Mehdi",
    slack_name: "mehdi.benjdi",
    email: "elmehdi@ben.com",
    job_title: "Senior Financial Analyst II",
    password: "12345678",
    is_manager: false
  )
    file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1673190740/pyp2lkzx5ec4awqextwq.jpg")
    mehdi.photo.attach(io: file, filename: "mehdi.jpg", content_type: "image/jpg")
    mehdi.save

joe = User.new(
  name: "Joe",
  slack_name: "joesando",
  email: "joe@luc.com",
  job_title: "Senior Financial Analyst II",
  password: "12345678",
  is_manager: false
)
  file = URI.open("https://avatars.githubusercontent.com/u/105550930?v=4")
  joe.photo.attach(io: file, filename: "joe.jpg", content_type: "image/jpg")
  joe.save

luyee = User.new(
  name: "Luyee",
  slack_name: "wongluyee1015",
  email: "luyee@wong.com",
  job_title: "Senior Financial Analyst II",
  password: "12345678",
  is_manager: false
)
file = URI.open("https://avatars.githubusercontent.com/u/111058709?v=4")
luyee.photo.attach(io: file, filename: "luyee.jpg", content_type: "image/jpg")
luyee.save

ocean = User.new(
  name: "Ocean",
  email: "ocean@wong.com",
  job_title: "Financial Analyst I",
  password: "12345678",
  is_manager: false
)

url = 'https://this-person-does-not-exist.com/en'
doc = Nokogiri::HTML(URI.open(url).read)
src = doc.search('#avatar').first['src']
photo_url = "https://this-person-does-not-exist.com#{src}"
file = URI.open(photo_url)
ocean.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
ocean.save

timber = User.new(
  name: "Timber",
  email: "timber@smith.com",
  job_title: "Financial Analyst",
  password: "12345678",
  is_manager: false
)

url = 'https://this-person-does-not-exist.com/en'
doc = Nokogiri::HTML(URI.open(url).read)
src = doc.search('#avatar').first['src']
photo_url = "https://this-person-does-not-exist.com#{src}"
file = URI.open(photo_url)
timber.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
timber.save

parker = User.new(
  name: "Parker",
  email: "parker@ocean.com",
  job_title: "Financial Analyst II",
  password: "12345678",
  is_manager: false
)

url = 'https://this-person-does-not-exist.com/en'
doc = Nokogiri::HTML(URI.open(url).read)
src = doc.search('#avatar').first['src']
photo_url = "https://this-person-does-not-exist.com#{src}"
file = URI.open(photo_url)
parker.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
parker.save

jordan = User.new(
  name: "Jordan",
  email: "jordan@ocean.com",
  job_title: "Intern Financial Analyst",
  password: "12345678",
  is_manager: false
)

url = 'https://this-person-does-not-exist.com/en'
doc = Nokogiri::HTML(URI.open(url).read)
src = doc.search('#avatar').first['src']
photo_url = "https://this-person-does-not-exist.com#{src}"
file = URI.open(photo_url)
jordan.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
jordan.save

charlie = User.new(
  name: "Charlie",
  email: "charlie@parker.com",
  job_title: "Senior Financial Analyst",
  password: "12345678",
  is_manager: false
)

url = 'https://this-person-does-not-exist.com/en'
doc = Nokogiri::HTML(URI.open(url).read)
src = doc.search('#avatar').first['src']
photo_url = "https://this-person-does-not-exist.com#{src}"
file = URI.open(photo_url)
charlie.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
charlie.save

jupiter = User.new(
  name: "Jupiter",
  email: "jupiter@saturn.com",
  job_title: "Financial Analyst",
  password: "12345678",
  is_manager: false
)

url = 'https://this-person-does-not-exist.com/en'
doc = Nokogiri::HTML(URI.open(url).read)
src = doc.search('#avatar').first['src']
photo_url = "https://this-person-does-not-exist.com#{src}"
file = URI.open(photo_url)
jupiter.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
jupiter.save

halston = User.new(
  name: "Halston",
  email: "halston@chip.com",
  job_title: "Financial Analyst",
  password: "12345678",
  is_manager: false
)

url = 'https://this-person-does-not-exist.com/en'
doc = Nokogiri::HTML(URI.open(url).read)
src = doc.search('#avatar').first['src']
photo_url = "https://this-person-does-not-exist.com#{src}"
file = URI.open(photo_url)
halston.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
halston.save

# users << User.all

puts 'Creating tasks...'
tasks = []
Task.create!(
  task_title: "Do analysis of Amazon Fresh project X",
  description: "Finish the analysis and do review with manager",
  priority: "High",
  due_date: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 31, format: :short),
  status: "Done"
)

Task.create!(
  task_title: "Report of the warehouse financials",
  description: "audit and create report of warehouse financials",
  priority: "Medium",
  due_date: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 31, format: :short),
  status: "Done"
)

Task.create!(
  task_title: "Audit of Amazon Video Financials",
  description: "Team up with cross functional team to audit amazon video financials",
  priority: "Medium",
  due_date: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 31, format: :short),
  status: "Done"
)

Task.create!(
  task_title: "Create summary report for CFO",
  description: "summarize quarter financials for CFO and present findings",
  priority: "High",
  due_date: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 31, format: :short),
  status: "Done"
)

Task.create!(
  task_title: "Quarterly report for CEO",
  description: "create summary report for CEO and prepare presentation slides",
  priority: "High",
  due_date: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 31, format: :short),
  status: "In Progress"
)

Task.create!(
  task_title: "Amazon Prime LOTR financial review",
  description: "review the financials for LOTR production",
  priority: "High",
  due_date: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 31, format: :short),
  status: "In Progress"
)

Task.create!(
  task_title: "SaaS costs benefits review",
  description: "Review existing Saas products to see if it makes sense to continue subscription",
  priority: "Medium",
  due_date: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 31, format: :short),
  status: "In Progress"
)

Task.create!(
  task_title: "Review the costs for the AWS server in Asia",
  description: "review the costs for servers in asia and report them to manager",
  priority: "High",
  due_date: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 31, format: :short),
  status: "In Progress"
)

Task.create!(
  task_title: "Submit the budget request for new software proMGR",
  description: "submit the request for budget allocation for new software",
  priority: "Low",
  due_date: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 31, format: :short),
  status: "In Progress"
)

Task.create!(
  task_title: "Plan the townhall meeting",
  description: "Plan and create agenda for the townhall meeting",
  priority: "Medium",
  due_date: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 31, format: :short),
  status: "In Progress"
)

Task.create!(
  task_title: "Product Manager report",
  description: "Do the report for product manager as requested",
  priority: "High",
  due_date: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 31, format: :short),
  status: "In Progress"
)

Task.create!(
  task_title: "Initial analysis of startup M&A deal",
  description: "assist M&A team  and do the analysis for startup Y M&A deal",
  priority: "High",
  due_date: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 31, format: :short),
  status: "In Progress"
)

tasks << Task.all

puts 'Creating user tasks...'
tasks = Task.all.shuffle
10.times do
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
overtime_users = User.all.sample(5)

overtime_users.each do |user|
  date = today - 1
  until date == today - 30
    Timesheet.create!(
      user: user,
      attendance: "working",
      comment: "Working on the project",
      time_in: DateTime.parse("#{date} 00:#{rand(0...15)}:00"),
      time_out: DateTime.parse("#{date} 09:#{rand(20...50)}:00")
    )
    date -= 1
  end
end

less_overtime_users = User.where.not(id: overtime_users.pluck(:id))

less_overtime_users.each do |user|
  date = today - 1
  until date == today - 30
    Timesheet.create!(
      user: user,
      attendance: "working",
      comment: "Working on the project",
      time_in: DateTime.parse("#{date} 00:#{rand(0...5)}:00"),
      time_out: DateTime.parse("#{date} 09:#{rand(0...20)}:00")
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
  user: User.find_by(name: "Mehdi"),
  title: "Recruit and train",
  description: "Recruit a new member to my engineering team and train them to the point
  that their performance is satisfactory within the next three months",
  status: "in_progress"
)
Goal.create!(
  user: User.find_by(name: "Joe"),
  title: "Increase income",
  description: "To increase the net income by 10% for projects in charge.",
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
