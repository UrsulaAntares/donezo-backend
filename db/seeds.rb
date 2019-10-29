# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Deed.destroy_all

User.find_or_create_by(name: "Ursula", username: "Urs")
User.find_or_create_by(name: "Frank", username: "Frank")
User.create(name: "John", username: "John")
Deed.find_or_create_by(title: "Make the relationships")
Deed.create(title: "something else")

Deed.create(title: "something else")
# Environment.find_or_create_by(title: "Home")
# Environment.find_or_create_by(title: "Internet")
# Environment.find_or_create_by(title: "Computer")
# Environment.find_or_create_by(title: "Walkable")
# Environment.find_or_create_by(title: "Driving")