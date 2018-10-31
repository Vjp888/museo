class Curator
  attr_reader :artists, :photographs
  def initialize
    @artists = []
    @photographs = []
  end

  def add_photograph(photo)
    @photographs << Photograph.new(photo)
  end

  def add_artist(artist)
    @artists << Artist.new(artist)
  end

  def find_artist_by_id(id)
    @artists.find do |artist|
      artist.id.to_i == id.to_i
    end
  end

  def find_photograph_by_id(id)
    @photographs.find do |photo|
      photo.id.to_i == id.to_i
    end
  end
end
