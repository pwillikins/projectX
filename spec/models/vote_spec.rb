require 'spec_helper'

describe Vote do
  it "can create a new vote" do
    vote = Vote.new(artist_name: "Pepper", song_name: "Ashes")

    expect(vote).to be_valid
    expect(vote.artist_name).to eq "Pepper"
    expect(vote.song_name).to eq "Ashes"
  end

  it "can't create a valid vote" do
    vote = Vote.new

  end
end