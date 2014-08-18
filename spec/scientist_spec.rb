require 'spec_helper'

describe 'Scientist' do
  it "does not save scientists with a name longer than 50 characters" do
    new_scientist = Scientist.create({:name => "Ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"})
    expect(Scientist.all).to eq []
  end
end
