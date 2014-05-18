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
    image_array[-1].each do |_, value|
      images << value
    end
    images[0]
  end
end