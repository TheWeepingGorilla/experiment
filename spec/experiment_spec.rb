require 'spec_helper'

describe 'Experiment' do
  it "returns experiments without a start time when called with that scope" do
    new_experiment = Experiment.create({:description => "Shock Test", :location => "Lab 1"})
    expect(Experiment.no_start[0]).to eq new_experiment
  end
end
