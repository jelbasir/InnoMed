# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(first_name: 'Holly', last_name: 'Christmas', email: "holly@gmail.com", password: "abc123", password_confirmation: "abc123")
User.create(first_name: 'Rachel', last_name: 'Green', email: "iliketoshop@gmail.com", password: "abc123", password_confirmation: "abc123")
User.create(first_name: 'Ross', last_name: 'Gellar', email: "ross123@hotmail.com", password: "abc123", password_confirmation: "abc123")
User.create(first_name: 'Charlie', last_name: 'Brown', email: "charlie@gmail.com", password: "abc123", password_confirmation: "abc123")
User.create(first_name: 'Lucy', last_name: 'van Pelt', email: "bluedresses4va@gmail.com", password: "abc123", password_confirmation: "abc123")