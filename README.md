# Rails Set up Commands
$ rails new cat-tinder-backend -d postgresql -T
$ cd cat-tinder-backend 
$ git remote add origin https://github.com/learn-academy-2022-charlie/cat-tinder-backend-instructors-charlean-austin-sarah.git
$ git checkout -b main
$ bundle add rspec-rails
$ rails generate rspec:install
$ rails db:create
$ rails s
$ git add .
$ git commit -m "Initial Commit with RSPEC and PostgreSQL"
$ git push origin main