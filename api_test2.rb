require 'net/http'
require 'json'
require 'test/unit'
require 'rest-client'

class APITest < Test::Unit::TestCase
  def setup
    response = RestClient.get("https://itunes.apple.com/search?term=Yuriy+Nikulin&entity=ebook",
    {
        "Content-Type" => "application/json"
    }
    )
    @data = JSON.parse(response.body)
  end

  def test_result_count_validation
    assert_equal 10, @data["resultCount"]
  end

  def test_genre_validation
    @new_data = @data["results"]
    puts @new_data
    # Apologies..I got stuck on looping through response objects to pinpoint Biographies & Memoirs
    # assert_equal 3, @new_data[]["genres"]
  end
end