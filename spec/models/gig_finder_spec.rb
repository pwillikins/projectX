require 'spec_helper'

describe GigFinder do
  it "can find artist id" do
    VCR.use_cassette("gig_finder/find_artist_id") do
      finder = GigFinder.new

      expected_artist_id = 42687

      expect(finder.find_artist_id("Dr_Dog")).to eq expected_artist_id
    end
  end

  it "can search for artist events using an artist id" do
    VCR.use_cassette("gig_finder") do
      finder = GigFinder.new

      expected_artist_events = {"Hot August Music Festival" => "Cockeysville, MD, US"}

      expect(finder.find_events(42687)).to include expected_artist_events
    end
  end

  it "can return album artwork by artist" do
    VCR.use_cassette("gig_finder/find_image") do
      finder = GigFinder.new

      expected_image = "http://userserve-ak.last.fm/serve/500/35216679/311.jpg"


      expect(finder.find_image("311")).to include expected_image
    end
  end

  it "returns the name of the artist" do
    VCR.use_cassette("gig_finder/find_name") do
      finder = GigFinder.new

      expected_name = "Skrillex"

      expect(finder.find_artist_name("skrillex")).to eq expected_name
    end
  end

  it "returns a list of the artists songs" do
    VCR.use_cassette("song_finder/find_songs") do
      finder = GigFinder.new

      expected = "Lonesome"

      expect(finder.find_songs_by_artist("dr dog")).to include expected
    end
  end
end