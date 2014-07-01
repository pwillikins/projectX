class GigsController < ApplicationController

  before_filter :authenticate

  def index
    artist_name = params[:band_name]
    artist_id = GigFinder.new.find_artist_id(artist_name)
    @display_name = GigFinder.new.find_artist_name(artist_name)
    @gigs = GigFinder.new.find_events(artist_id)
    @image_url = GigFinder.new.find_image(artist_name)

    # remote = Songkickr::Remote.new API_KEY
    # @results = remote.events(type: "concert", artists: params[:band_name])
  end
end