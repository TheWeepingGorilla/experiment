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

def main_menu
  header
  puts "E > Edit an experiment"
  puts "A > Add an experiment"
  puts "D > Delete an experiment"
  puts "L > List experiments"
  puts "X > Exit"
  choice = gets.chomp.upcase
  case choice
  when 'A'
    add_experiment
  when 'E'
    edit_experiment
  when 'D'
    delete_experiment
  when 'L'
    list_experiments
    puts "Press return to continue."
    gets
  when 'X'
    puts "Have an excellent day!"
    exit
  else
    puts 'Invalid input. Try again.'
  end
  main_menu
end

def add_experiment
  puts "Please enter a description of the experiment:"
  e_desc = gets.chomp
  puts "Please enter a location for the experiment:"
  e_loc = gets.chomp
  puts "Please enter a start date and time for the experiment."
  puts "Please use the following format: DD/MM/YYYY HH:MM:SS"
  puts "For example, 31/10/2014 22:00:00"
  e_start = gets.chomp
  puts "Please enter an end date and time for the experiment."
  puts "Please use the following format: DD/MM/YYYY HH:MM:SS"
  puts "For example, 31/10/2014 23:00:00"
  e_end = gets.chomp
  new_experiment = Experiment.create({:description => e_desc, :location => e_loc,
                            :start => e_start, :end => e_end})
  puts "Saved!  Press return to continue."
  gets
end

header
main_menu
