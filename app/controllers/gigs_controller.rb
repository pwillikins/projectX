class GigsController < ApplicationController

  def index
    @artist_id = GigFinder.new.find_artist_id(params[:band_name])
    @gigs = GigFinder.new.find_events(@artist_id)
    @image_url = GigFinder.new.find_image(params[:band_name])
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