require 'spec_helper'

describe Vote do
  it "can create a new vote" do
    vote = Vote.create(artist_name: "Pepper", song_name: "Ashes")

    expect(vote).to be_valid
    expect(vote.artist_name).to eq "Pepper"
    expect(vote.song_name).to eq "Ashes"
  end

  # it "cannot create a valid vote" do
  #   vote = Vote.create(song_name: "")
  #   expect(vote).to_not be_valid
  # end
end