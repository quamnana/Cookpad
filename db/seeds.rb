# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Seeding database....'

# Users
User.create(
  first_name: 'Nana',
  last_name: 'Quam',
  username: 'nquam',
  email: 'quam@gmail.com',
  password: 'password',
  password_confirmation: 'password',
)

User.create(
  first_name: 'Joe',
  last_name: 'Doe',
  username: 'jdoe',
  email: 'john@gmail.com',
  password: 'password',
  password_confirmation: 'password',
)
