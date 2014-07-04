class VotesController < ApplicationController

  before_filter :authenticate

  def new
    @gig_id = params[:gig_id]
    @vote = Vote.new
    @display_name = params[:artist]
    @venue = params[:venue]
    @location = params[:location]
    @song_list = SongFinder.new.find_songs_by_artist(params[:artist])
  end

  def create
    songs = params[:songs].keys
    artist_name = params[:artist]

    songs.each do |song|
      @vote = Vote.new(user_id: @current_user.id,
                       song_name: song,
                       artist_name: artist_name,
                       gig_id: params[:gig_id])
      @vote.save
    end
    flash[:notice] = "Your votes have been submitted!"
    redirect_to votes_for_gig_path(gig_id: params[:gig_id])
  end


  def votes_for_gig
    @name = []
    gig_id = params[:gig_id]
    @show_votes = Vote.where(gig_id: gig_id).group(:artist_name, :song_name).count
    @show_votes.each do |array, count|
       @name << array.first
    end
  end

  def votes_for_user
    user_id = @current_user.id
    @user_votes = Vote.where(user_id: user_id).group(:artist_name, :song_name).count

  end

  def show

  end
end
