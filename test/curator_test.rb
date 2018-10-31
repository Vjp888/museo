require 'minitest/autorun'
require 'minitest/pride'
require './lib/curator'
require './lib/photograph'
require './lib/artist'

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

end
