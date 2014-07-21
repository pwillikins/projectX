class GigsController < ApplicationController

  before_filter :authenticate

  def index
    artist_name = params[:band_name]
    if artist_name.empty?
      redirect_to index_path
      flash[:notice] = "You must enter a valid artist name"
    else
      artist = ArtistInfo.new(artist_name)
      @gigs = GigFinder.new.find_gigs_for_artist(artist_name)
      @image_url = artist.find_artist_image
      @display_name = artist.find_display_name
    end
  end
end