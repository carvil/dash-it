# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# Test user to get started working on the app right away in development
ada = User.find_or_create_by_email('ada@example.com', password: 'lovelace', password_confirmation: 'lovelace')
if ada.projects.size == 0
  project = ada.projects.create(name: "Become world's first computer programmer")
else
  project = ada.projects.first
end
project.todos.create(status: 'done', description: "Get introduced to Charles Babbage")
project.todos.create(status: 'todo', description: "Create a method for calculating a sequence of Bernoulli numbers with the Analytical Engine")
