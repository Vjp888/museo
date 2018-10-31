require 'minitest/autorun'
require 'minitest/pride'
require './lib/photograph'
require './lib/artist'

class PhotographTest < MiniTest::Test

  def setup
    @attributes_1 = {id: "1",
                    name: "Rue Mouffetard, Paris (Boy with Bottles)",
                    artist_id: "4",
                    year: "1954"
                  }
    @attributes_2 = {id: "2",
                    name: "Ansel Adams",
                    born: "1902",
                    died: "1984",
                    country: "United States"
                  }


  end

  def test_it_exists
    photo = Photograph.new(@attributes_1)

    assert_instance_of Photograph, photo
  end

  def test_it_can_get_info
    photo = Photograph.new(@attributes_1)
    name = "Rue Mouffetard, Paris (Boy with Bottles)"

    assert_equal "1", photo.id
    assert_equal name, photo.name
    assert_equal "4", photo.artist_id
    assert_equal "1954", photo.year
  end


end
