require 'spec_helper'

describe SongFinder do
  it "returns a list of votes" do
    finder = SongFinder.new

    expect(finder.find_songs_for_artist("dr dog")).to include "lonesome"
  end
end