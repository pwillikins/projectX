class VotesController < ApplicationController

  before_filter :authenticate

  def new
    if Vote.where(user_id: current_user.id, gig_id: params[:gig_id]).present?
      redirect_to index_path
      flash[:notice] = "You have already voted for this concert"
    else
      @vote = Vote.new
      @gig_id = params[:gig_id]
      @display_name = params[:artist]
      @gig_display_name = params[:gig_display_name]
      @song_list = SongFinder.new.find_songs_for_artist(@display_name)
    end
  end

  def create
    if params[:songs].nil?
      redirect_to :back
      flash[:notice] = "You forgot to select a song"
    else
      songs = params[:songs].keys
      artist_name = params[:artist]

      songs.each do |song|
        vote = Vote.new(user_id: current_user.id,
                        song_name: song,
                        artist_name: artist_name,
                        gig_id: params[:gig_id],
                        gig_display_name: params[:gig_display_name])
        vote.save
      end
      flash[:notice] = "Your votes have been submitted!"
      redirect_to votes_for_gig_path(gig_id: params[:gig_id])
    end
  end

  def votes_for_gig
    @name = []
    gig_id = params[:gig_id]
    @show_votes = Vote.where(gig_id: gig_id).group(:artist_name, :song_name).count.sort_by { |_, v| v }.reverse
    @show_votes.each do |array, _|
      @name << array.first
    end
  end

  def votes_for_user
    user_id = current_user.id
    @user_votes = Vote.where(user_id: user_id).group(:artist_name, :song_name).count.sort_by { |k, _| k }
  end

end
