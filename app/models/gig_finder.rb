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
      info["venue"]["displayName"] = ["venue"]["metroArea"]["displayName"]
    end
    info
  end
end
