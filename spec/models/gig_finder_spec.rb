require 'spec_helper'

describe GigFinder do
  it "can search for artist events" do
    VCR.use_cassette("gig_finder/find_gigs_for_artist") do
      finder = GigFinder.new.find_gigs_for_artist("pepper")

        expect(finder.results.map {|x| x.display_name}).to include "Dirty Heads and Pepper with Katastro at Cabooze (July 16, 2014)"
    end
  end

  it "can return album artwork by artist" do
    VCR.use_cassette("artist_info/find_display_image") do
      finder = ArtistInfo.new("311")

      expect(finder.find_artist_image).to include "http://userserve-ak.last.fm/serve/_/386371.jpg"
    end
  end

  it "returns the name of the artist" do
    VCR.use_cassette("gig_finder/find_display_name") do
      finder = ArtistInfo.new("skrillex")

      expect(finder.find_display_name).to eq "Skrillex"
    end
  end

  it "returns a list of the artists songs" do
    VCR.use_cassette("song_finder/find_songs_for_artist") do
      finder = SongFinder.new

      expect(finder.find_songs_for_artist("dr dog")).to include "Lonesome"
    end
  end
end