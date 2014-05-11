require 'spec_helper'

describe GigFinder do
  it "can find artist id" do
    finder = GigFinder.new

    expected_artist_id = 42687

    expect(finder.find_artist_id('Dr_Dog')).to eq expected_artist_id
  end

  it "can search for artist events using an artist id" do
    finder = GigFinder.new

    expected_artist_events = "Hot August Music Festival"

    expect(finder.find_events(42687)).to include expected_artist_events

  end
end


