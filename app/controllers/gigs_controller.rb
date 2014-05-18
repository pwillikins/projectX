require 'gig_finder'

class GigsController < ApplicationController

  def index
    artist_name = params[:band_name]
    @artist_name = GigFinder.new.find_artist_name(artist_name)
    @artist_id = GigFinder.new.find_artist_id(artist_name)
    @gigs = GigFinder.new.find_events(@artist_id)
    @image_url = GigFinder.new.find_image(artist_name)
  end

  def new

  end

  def show

  end

  def edit

  end

  def update

  end
end