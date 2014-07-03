class SongFinder

  def find_songs_by_artist(artist)
    songs = []
    response = Faraday.get "http://ws.spotify.com/search/1/track.json?q=#{artist}"
    song_data = JSON.parse(response.body)

    song_data["tracks"].select do |song|
      songs << song["name"]
    end
    songs.uniq!
  end
end