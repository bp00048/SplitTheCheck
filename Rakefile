# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

desc "Imports a CSV file into an ActiveRecord table"
task :csv_model_import, [:filename, :model] => :environment do |task,args|
  lines = File.new(args[:filename]).readlines
  header = lines.shift.strip
  keys = header.split(',')
  lines.each do |line|
    values = line.strip.split('|')
    attributes = Hash[keys.zip values]
    Module.const_get(args[:model]).create(attributes)
  end
end

Rails.application.load_tasks
