require 'active_record'
require 'pry'
require 'rspec'

require 'experiment'
require 'scientist'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['test']
ActiveRecord::Base.establish_connection(development_configuration)

RSpec.configure do |config|
  config.after(:each) do
    Experiment.all.each { |experiment| experiment.destroy }
    Scientist.all.each { |scientist| scientist.destroy }
  end
end
