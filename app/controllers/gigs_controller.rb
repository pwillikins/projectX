require 'gig_finder'

class GigsController < ApplicationController

  def index
    artist_name = params[:band_name]
    artist_id = GigFinder.new.find_artist_id(artist_name)
    @display_name = GigFinder.new.find_artist_name(artist_name)
    @gigs = GigFinder.new.find_events(artist_id)
    @image_url = GigFinder.new.find_image(artist_name)

    # remote = Songkickr::Remote.new API_KEY
    # @results = remote.events(type: "concert", artists: params[:band_name])
  end

  def new

  end

  def show
    @venue = params[:venue]
    @location = params[:location]
    @song_list = GigFinder.new.find_songs_by_artist(params[:artist])
  end

  def edit

  end

  def update

  end
end