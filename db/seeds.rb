# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
  # movies = Movie.create([
  #   { name: "Star Wars" },
  #   { name: "Lord of the Rings" }
  #    ])
#   Character.create(name: "Luke", movie: movies.first)
#   Character.create(name: "Gandalf", movie: movies.second)

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