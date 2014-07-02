class GigFinder

  def find_artist_id(artist)
    id = []
    response = Faraday.get "http://api.songkick.com/api/3.0/search/artists.json?query=#{artist}&apikey=12XsVy8nEO6w6CqL"
    artist_data = JSON.parse(response.body)

    artist_data["resultsPage"]["results"]["artist"].select do |x|
      id << x["id"]
    end
    id.first
  end

  def find_events(artist_id)
    info = {}
    response = Faraday.get "http://api.songkick.com/api/3.0/artists/#{artist_id}/calendar.json?apikey=12XsVy8nEO6w6CqL"
    artist_event_info = JSON.parse(response.body)

    artist_event_info["resultsPage"]["results"]["event"].each do |x|
      info[x["venue"]["displayName"]] = x["location"]["city"]
    end
    info
  end

  def find_image(artist)
    image_array = []
    response = Faraday.get "http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=#{artist}&api_key=b20186bc6bd9756f2777dd5f8dc4f4f5&format=json"
    image_data = JSON.parse(response.body)

    image_data["artist"]["image"].each do |image|
      image_array << image
    end
    images = []
    image_array.last.each do |_, value|
      images << value
    end
    images[0]
  end

  def find_artist_name(artist)
    artist_name = []
    response = Faraday.get "http://api.songkick.com/api/3.0/search/artists.json?query=#{artist}&apikey=12XsVy8nEO6w6CqL"
    json_data = JSON.parse(response.body)

    json_data["resultsPage"]["results"]["artist"].select do |name|
      artist_name << name["displayName"]
    end
    artist_name.first
  end

  # def find_songs_by_artist(artist)
  #   votes = []
  #   response = Faraday.get "http://ws.spotify.com/search/1/track.json?q=#{artist}"
  #   song_data = JSON.parse(response.body)
  #
  #   song_data["tracks"].select do |song|
  #     votes << song["name"]
  #   end
  #   votes
  # end
end


# def find_event_id(artist_id)
#   event_id_list = []
#   response = Faraday.get "http://api.songkick.com/api/3.0/artists/#{artist_id}/calendar.json?apikey=12XsVy8nEO6w6CqL"
#   event_data = JSON.parse(response.body)
#
#   event_data["resultsPage"]["results"]["event"].each do |a|
#     event_id_list << a["id"]
#   end
#   event_id_list
# end
