# class SongFinder
#
#   def find_songs(artist)
#     songs = []
#     response = Faraday.get "http://ws.spotify.com/search/1/track.json?q=#{artist}"
#      song_data = JSON.parse(response.body)
#
#     song_data["tracks"].select do |song|
#        songs << song["name"]
#     end
#     p songs
#   end
# end