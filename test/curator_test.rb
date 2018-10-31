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
    @photo_3 = {id: "3",
                name: "Identical Twins, Roselle, New Jersey",
                artist_id: "3",
                year: "1967"
                }
    @photo_4 = {id: "4",
                name: "Child with Toy Hand Grenade in Central Park",
                artist_id: "3",
                year: "1962"
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
    @artist_3 = {id: "3",
                name: "Diane Arbus",
                born: "1923",
                died: "1971",
                country: "United States"
                }
    @curator = Curator.new
    @curator.add_photograph(@photo_1)
    @curator.add_photograph(@photo_2)
    @curator.add_photograph(@photo_3)
    @curator.add_photograph(@photo_4)
    @curator.add_artist(@artist_1)
    @curator.add_artist(@artist_2)
    @curator.add_artist(@artist_3)
    @diane_arbus = @curator.find_artist_by_id("3")
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
    artist = curator.find_artist_by_id(1)

    assert_equal "Henri Cartier-Bresson", artist.name
  end

  def test_it_can_find_photo_by_id
    curator = Curator.new
    curator.add_photograph(@photo_1)
    curator.add_photograph(@photo_2)
    photo_name = "Rue Mouffetard, Paris (Boy with Bottles)"
    photo = curator.find_photograph_by_id(1)

    assert_equal photo_name, photo.name
  end

  def test_it_can_find_by_artist
    photos = @curator.find_photographs_by_artist(@diane_arbus)

    assert_equal 2, photos.length
    assert_instance_of Photograph, photos.first
  end

  def test_it_can_find_artist_with_multiple_photos
    multi_photo_artists = @curator.artists_with_multiple_photographs

    assert_equal "Diane Arbus", multi_photo_artists.first.name
    assert_equal @diane_arbus, multi_photo_artists.first
  end

  def test_it_can_find_photos_by_location
    loc_photos = @curator.photographs_taken_by_artists_from("United States")

    assert_equal "Moonrise, Hernandez", loc_photos.first.name
    assert_equal 3, loc_photos.length
    assert_equal "4", loc_photos.last.id

    bad_loc_photos = @curator.photographs_taken_by_artists_from("Argentina")
    assert_equal [], bad_loc_photos
  end
end
