class VotesController < ApplicationController

  before_filter :authenticate

  def new
    @venue = params[:venue]
    @location = params[:location]
    @song_list = SongFinder.new.find_songs_by_artist(params[:artist])
    # @display_name = GigFinder.new.find_artist_name(params[:artist])
  end

  def create
    @vote = Vote.new(user_id: @current_user.id, )
  end
end