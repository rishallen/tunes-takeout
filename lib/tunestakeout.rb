# this is the one that is talking to Charles API
require 'httparty'

class Food
  BASE_URL = "https://tunes-takeout-api.herokuapp.com/"
  attr_reader :search

  def initialize(data)
    @search = data["search"]
  end

  def self.find(query, limit = 10, seed = query)
    # /v1/suggestions/search?query=banana
    # http://pokeapi.co/api/v2/pokemon/25/
    # find a tune with the passed id
    data = HTTParty.get(BASE_URL + "/v1/suggestions/search?query=#{query}&limit=#{limit}&seed=#{query}").parsed_response

    # return an instance of pokemon for that id
    self.new(data)
  end
end
