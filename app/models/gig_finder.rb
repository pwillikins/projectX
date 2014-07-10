class GigFinder
  require 'songkickr'

  def initialize
    @remote = Songkickr::Remote.new ENV['SONGKICK']
  end

  def find_gigs_for_artist(artist_name)
     @remote.events(artist_name: artist_name)
  end
end

