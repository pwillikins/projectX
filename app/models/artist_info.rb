class ArtistInfo

  def initialize(name)
    @name = name
  end

  def find_artist_image
    Echowrap.artist_images(name: @name, results: 1).first.url
  end

  def find_display_name
    Echowrap.artist_profile(name: @name).name
  end
end