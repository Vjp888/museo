require 'minitest/autorun'
require 'minitest/pride'
require './lib/curator'
require './lib/photograph'
require './lib/artist'
require 'pry'

class CuratorTest < MiniTest::Test

  def setup
    @photo_1 = { id: "1",
              name: "Rue Mouffetard, Paris (Boy with Bottles)",
              artist_id: "1",
              year: "1954"
              }
    @photo_2 = {id: "2",
                name: "Moonrise, Hernandez",
                artist_id: "2",
                year: "1941"
                }
    @artist_1 = {id: "1",
                name: "Henri Cartier-Bresson",
                born: "1908",
                died: "2004",
                country: "France"
                }
    @artist_2 = {id: "2",
                name: "Ansel Adams",
                born: "1902",
                died: "1984",
                country: "United States"
                }
  end

  def test_it_exists
    curator = Curator.new

    assert_instance_of Curator, curator
  end

  def test_variables_can_be_accessed
    curator = Curator.new

    assert_equal [], curator.artists
    assert_equal [], curator.photographs
  end

  def test_it_can_add_photos
    curator = Curator.new
    curator.add_photograph(@photo_1)
    assert_equal "1", curator.photographs.first.id

    curator.add_photograph(@photo_2)
    assert_equal "2", curator.photographs.last.id
  end

  def test_it_can_add_artists
    curator = Curator.new

    curator.add_artist(@artist_1)
    assert_equal "Henri Cartier-Bresson", curator.artists.first.name


    curator.add_artist(@artist_2)
    assert_equal "Ansel Adams", curator.artists.last.name
  end

  def test_it_can_find_artist_by_id
    curator = Curator.new
    curator.add_artist(@artist_1)
    curator.add_artist(@artist_2)
    assert_equal "Henri Cartier-Bresson", curator.artists.first.name
  end

end
