# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: "Susan", last_name: "DeGeneres", email: "susan@susan.com")
Category.create(name: "Health")
Category.create(name: "Finance")
Category.create(name: "Relationships")

Habit.create(title: "Meditation", description: "TM twice per day", user: User.first, category: Category.first)
Habit.create(title: "Green Smoothie", description: "Make a morning shake with kale and spinach", user: User.first, category: Category.first)
Habit.create(title: "Floss", description: "Floss every evening", user: User.first, category: Category.first)
Habit.create(title: "Measure waist", description: "Keep on track for marathon season", user: User.first, category: Category.first)
