require "sqlite3"
DB = SQLite3::Database.new('tasks.db')
DB.results_as_hash = true
require_relative 'task'

#Create
# task = Task.new(title: "Go Home ", description: "Finishing soon")
# task.save 

#Read
# task = Task.find(1)
# puts "#{task.title} #{task.description}"

# Read all
Task.all.each do |task|
    puts "#{task.title} #{task.description} #{task.done ? '[✅]' : '[❌]'}"
end

#Update
# task = Task.find(1)
# task.done = true
# task.save

#Delete
# task = Task.find(1)
# task.destroy
