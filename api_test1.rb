require 'net/http'
require 'json'
require 'test/unit'
require 'rest-client'

class APITest < Test::Unit::TestCase
  def setup
    response = RestClient.get("https://itunes.apple.com/search?term=The+Killers&entity=album",
    {
        "Content-Type" => "application/json"
    }
    )
    @data = JSON.parse(response.body)
  end

  def test_result_count_validation
    # puts @data
    assert_equal 50, @data["resultCount"]
  end

  def test_album_name
    # puts @data["results"]
    @new_data = @data["results"]
    puts @new_data[8]["collectionName"]
    assert_equal "Sam’s Town", @new_data[8]["collectionName"]
  end
end