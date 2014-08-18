require 'spec_helper'

describe 'Scientist' do
  it "does not save scientists with a name longer than 50 characters" do
    new_scientist = Scientist.create({:name => "Ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"})
    expect(Scientist.all).to eq []
  end
  it "is associated with many experiments" do
    new_scientist = Scientist.create({:name => "Dr. Bronner"})
    experiment1 = Experiment.create({:description => "Shock Test", :location => "Lab 1"})
    experiment2 = Experiment.create({:description => "Road Test", :location => "Parking Lot"})
    new_scientist.experiments << experiment1
    new_scientist.experiments << experiment2
    expect(new_scientist.experiments).to eq [experiment1,experiment2]
  end
end

