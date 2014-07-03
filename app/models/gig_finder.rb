class GigFinder

  def find_artist_id(artist)
    response = Faraday.get "http://api.songkick.com/api/3.0/search/artists.json?query=#{artist}&apikey=#{ENV['SONGKICK']}"
    artist_data = JSON.parse(response.body)
    artist_data["resultsPage"]["results"]["artist"].first["id"]
  end

  def find_events(artist_id)
    info = {}
    response = Faraday.get "http://api.songkick.com/api/3.0/artists/#{artist_id}/calendar.json?apikey=#{ENV['SONGKICK']}"
    artist_event_info = JSON.parse(response.body)

    artist_event_info["resultsPage"]["results"]["event"].each do |x|
      info[x["venue"]["displayName"]] = {
        gig_id: x["id"],
        venue: x["venue"]["displayName"],
        location: x["location"]["city"]
      }
    end
    info
  end

  def find_image(artist)
    image_array = []
    response = Faraday.get "http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=#{artist}&api_key=#{ENV['LASTFM']}&format=json"
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
    response = Faraday.get "http://api.songkick.com/api/3.0/search/artists.json?query=#{artist}&apikey=#{ENV['SONGKICK']}"
    json_data = JSON.parse(response.body)

    json_data["resultsPage"]["results"]["artist"].select do |name|
      artist_name << name["displayName"]
    end
    artist_name.first
  end
end

