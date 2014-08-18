require 'spec_helper'

describe 'Experiment' do
  it "returns experiments without a start time when called with that scope" do
    new_experiment = Experiment.create({:description => "Shock Test", :location => "Lab 1"})
    expect(Experiment.no_start[0]).to eq new_experiment
  end
  it "is associated with many scientists" do
    new_scientist = Scientist.create({:name => "Dr. Bronner"})
    new_scientist2 = Scientist.create({:name => "Dr. Spock"})
    experiment1 = Experiment.create({:description => "Shock Test", :location => "Lab 1"})
    experiment1.scientists << new_scientist
    experiment1.scientists << new_scientist2
    binding.pry
    expect(experiment1.scientists).to eq [new_scientist,new_scientist2]
  end
end
