class GigsController < ApplicationController

  before_filter :authenticate

  def index
    gigs = GigFinder.new
    artist_name = params[:band_name]
    artist_id = gigs.find_artist_id(artist_name)
    @display_name = gigs.find_artist_name(artist_name)
    @gigs = gigs.find_events(artist_id)
    @image_url = gigs.find_image(artist_name)

    # remote = Songkickr::Remote.new API_KEY
    # @results = remote.events(type: "concert", artists: params[:band_name])
  end
end