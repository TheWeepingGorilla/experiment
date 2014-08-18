require 'active_record'
require 'date'
require './lib/experiment'
require './lib/scientist'
require 'pry'

database_configurations = YAML::load(File.open('./db/config.yml'))
test_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(test_configuration)

def header
  system 'clear'
  puts "*" * 30
  puts "Experiment"
  puts "*" * 30
  puts "\n"
end
