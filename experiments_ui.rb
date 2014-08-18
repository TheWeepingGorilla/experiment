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

def edit_experiment
  list_experiments
  puts "Please enter id number of experiment to edit."
  id_to_edit = gets.chomp.to_i
  e_to_edit = Experiment.find(id_to_edit)
  puts "D > Description edit"
  puts "L > Location edit"
  puts "S > Start date/time edit"
  puts "E > End date/time edit"
  choice = gets.chomp.upcase
  case choice
  when 'D'
    puts "Enter new description:"
    new_desc = gets.chomp
    e_to_edit.update({:description => new_desc})
    puts "Done. Press return to continue."
    gets
  when 'L'
    puts "Enter new location:"
    new_loc = gets.chomp
    e_to_edit.update({:location => new_loc})
    puts "Done. Press return to continue."
    gets
  when 'S'
    puts "Enter new start date/time."
    puts "Please use the format DD/MM/YYYY HH:MM:SS"
    new_start = gets.chomp
    e_to_edit.update({:start => new_start})
    puts "Done. Press return to continue."
    gets
  when 'E'
    puts "Enter new end date/time."
    puts "Please use the format DD/MM/YYYY HH:MM:SS"
    new_end = gets.chomp
    e_to_edit.update({:end => new_end})
    puts "Done. Press return to continue."
    gets
  else
    puts 'Invalid input. Press return to continue.'
    gets
  end
end

def delete_experiment
  list_experiments
  puts "Please enter id number of experiment to delete."
  puts "(If you enter an invalid id, nothing will be deleted)."
  id_to_del = gets.chomp.to_i
  e_to_destroy = Experiment.find(id_to_del)
  e_to_destroy.destroy
  puts "Done. Press return to continue."
  gets
end

def list_experiments
  puts
  Experiment.all.each do |experiment|
    puts "#{experiment.id}: #{experiment.description} at #{experiment.location}"
    puts "Starting at #{experiment.start} and ending at #{experiment.end}."
    puts "\n"
  end
end

header
main_menu
