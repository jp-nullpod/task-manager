require "sqlite3"
DB = SQLite3::Database.new('tasks.db')
DB.results_as_hash = true
require_relative 'task'

#Create

#Read
task = Task.find(1)
puts "#{task.title} #{task.description}"

# Read all
# Task.all.each do |task|
#     puts "#{task.title} #{task.description}"
# end

#Update

#Delete
# task = Task.find(1)
# task.destroy
