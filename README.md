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
  $ git checkout -b backend-structure
  $ rails generate resource Cat name:string age:integer enjoys:text image:text
  $ rails db:migrate
  $ rspec spec

# Seeds
```ruby

cats = [
  {
    name: 'Ketchup',
    age: 5,
    enjoys: 'Home Fried Burgers', 
    image: 'https://thiscatdoesnotexist.com/'
  },
  {
    name: 'Dog',
    age: 3,
    enjoys: 'Chasing cats', 
    image: 'https://www.shutterstock.com/image-photo/fitness-cat-lifting-heavy-big-dumbbell-283555859'
  },
  {
    name: 'Bolo',
    age: 7,
    enjoys: 'yarn', 
    image: 'https://unsplash.com/photos/XMxn_NkvnR0'
  },
  {
    name: 'Snowflake',
    age: 12,
    enjoys: 'Climbing trees', 
    image: 'https://s1.1zoom.me/big0/603/Cats_Snow_Black_Paws_514726_1280x720.jpg'
  }
]

cats.each do |attributes|
  Cat.create attributes
end

p Cat.all
p "Cat's Seeds worked out fine"
```
- Each time we run rails db:seed we will end up adding the mock data to our data base. SO if we ran it three times we would have 3 of each cat in our database.

# Cors
  $ bundle add rack-cors
  - Check that gem "rack-cors", "~> 1.1" was installed at the end of the GEMFILE
  - create the cors.rb file in the initializers folder
  - add the code to the cors.rb file
  $ bundle