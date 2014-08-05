class GigsController < ApplicationController

  before_filter :authenticate

  def index
    artist_name = params[:band_name]
    if artist_name.empty?
      redirect_to index_path
      flash[:notice] = "You must enter a valid artist name"
    else
      artist = ArtistInfo.new(artist_name)
      @display_name = artist.find_display_name
      if @display_name.nil?
        redirect_to index_path
        flash[:notice] = "You must enter a valid artist name"
      else
        @image_url = artist.find_artist_image
        @gigs = GigFinder.new.find_gigs_for_artist(artist_name)
      end
    end
  end

  def votes_for_past_shows
    artist = params[:artist]
    @gigs = Vote.new.find_gigs(artist)
  end

  def songs_voted_for_by_gig
    gig_id = params[:gig_id]
    @songs = Vote.new.find_songs(gig_id)
  end
end
