class Vote < ActiveRecord::Base

  belongs_to :user

  def find_gigs(artist)
    hash = {}
    Vote.where(artist_name: artist).group(:id).each do |vote|
      hash[vote.gig_display_name] = vote.gig_id
    end
    hash
  end

  def find_songs(gig_id)
    Vote.where(gig_id: gig_id).group(:song_name).count.sort_by { |vote| vote[1] }.reverse
  end

end