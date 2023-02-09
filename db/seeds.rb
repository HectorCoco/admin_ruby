# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = User.find_by(email: "admin@ryr.com")
unless user
  User.create(email: "admin@ryr.com", password: "4dm1nryr.", password_confirmation: "4dm1nryr.")
end
