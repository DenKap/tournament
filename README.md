<a href="https://codeclimate.com/github/DenKap/tournament/maintainability"><img src="https://api.codeclimate.com/v1/badges/ffcb66367dcc7640f240/maintainability" /></a>

# Tournament

App that allows users to register their teams in tournaments.
Login via ​Starladder​ ​OAuth2​ ​provider.

### Getting Started

* Ruby 2.4.0
* Rails 5.0.2
* PostgreSQL

`git clone git@github.com:DenKap/tournament.git`

`cd <tournament_directory>`

`bundle install`

(.ruby-gemset and .ruby-version are included)

`rails db:create`

`rails db:migrate`

Don't forget to run:

`rails db:seed`

Than `rails s` and go to

`http://127.0.0.1:3000/` in your browser

### Specs

All specs implemented with RSpec and could be run using `rspec` command inside project folder.
To install `rspec` please run `bundle install` inside project folder.

### Deployment

Deployment with Capistrano.
See and add your credentials to `/config/deploy.rb`, `/config/deploy/production.rb`
