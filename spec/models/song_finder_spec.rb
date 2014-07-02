# require 'spec_helper'
#
# describe SongFinder do
#   it "returns a list of votes" do
#     VCR.use_cassette("song_finder/find_songs") do
#       finder = SongFinder.new
#
#       expected = "Lonesome"
#
#       expect(finder.find_songs("dr dog")).to include expected
#     end
#   end
# end