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

  def find_photographs_by_artist(artist)
    photos = []
    @photographs.find_all do |photo|
      if photo.artist_id.to_i == artist.id.to_i
        photos << photo
      end
    end
    photos
  end

  def artists_with_multiple_photographs
    multi_photo_artists = []
    @artists.each do |artist|
      if find_photographs_by_artist(artist).length > 1
        multi_photo_artists << artist
      end
    end
    multi_photo_artists
  end
end
