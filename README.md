# ProMGR

<b>Description:</b>
Its an app that allows managers to manage their teams easily. 

Line managers in large corporations are responsible for delegating tasks efficiently, managing team performance(helping members complete tasks and achieve perfomance goals) and monitor team activity.

The problem is that data needed to make management decisions is typically segregated across multiple apps.For example, if a manager with a team of 10 wants to assign a task to someone appropriate and with few ongoing tasks, he has to check a trello board with over a 100 tasks displayed and check individual teamsheets to get the overtime information. Sifting through these apps takes time and the workflow process is not smooth, the larger the team becomes the time taken to make decisions is compounded.

With proMGR, managing teams become easy. Summarized data for team performance is available on the dashboard, allowing managers to plan activities and monitor performance efficiently.

## Usage
App home: https://promgr.herokuapp.com/users/sign_in


Manager
User: josh@ng.com
pW:12345678

Employee
User: joe@luc.com
pW:12345678


## Features

<u>Manager</u>




## Getting Started
### Setup

Install gems
```
bundle install
```
Install JS packages
```
yarn install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. For any APIs, see group Slack channel.
```
CLOUDINARY_URL=your_own_cloudinary_url_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 7](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — UI Prototyping

## Acknowledgements
Everyone did a great job!

## Team Members
- [Joshua Ng](https://github.com/joshnsw)
- [Joe Sandy](https://github.com/Luciensands)
- [El Mehdi](https://github.com/Mhiidooo)
- [Lu Yee](https://github.com/wongluyee)

