require 'minitest/autorun'
require 'minitest/pride'
require './lib/photograph'
require './lib/artist'

class ArtistTest < MiniTest::Test

  def setup
    @attributes_1 = {id: "2",
                    name: "Ansel Adams",
                    born: "1902",
                    died: "1984",
                    country: "United States"
                  }
  end

  def test_it_exists
    artist = Artist.new(@attributes_1)

    assert_instance_of Artist, artist
  end

  def test_it_can_get_info
    artist = Artist.new(@attributes_1)

    assert_equal "2", artist.id
    assert_equal "Ansel Adams", artist.name
    assert_equal "1902", artist.born
    assert_equal "1984", artist.died
    assert_equal "United States", artist.country
  end


end
