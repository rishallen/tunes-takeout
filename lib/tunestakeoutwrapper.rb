# this is the one that is talking to Charles API
require 'httparty'
# module
module TunesTakeout
  BASE_URL = "https://tunes-takeout-api.herokuapp.com/"
  attr_reader :search, :top_favorites_by, :final_results

  def self.search(query, limit = 10, seed = query)
    # /v1/suggestions/search?query=banana
    # find a tune with the passed query
    data = HTTParty.get(BASE_URL + "v1/suggestions/search?query=#{query}&limit=#{limit}&seed=#{query}").parsed_response
  end

  def self.top_favorites_by
    # hard coded limit of 20, possible refractor would be to make this an argument.
    data = HTTParty.get(BASE_URL + "v1/suggestions/top?limit=20").parsed_response
  end

  def self.final_results(suggestions_hash)
    # sending an id and retrieving the pairings for search
    @final_results = []
    suggestions = suggestions_hash["suggestions"]
    suggestions.each do |id|
      data = HTTParty.get(BASE_URL + "v1/suggestions/#{id["id"]}").parsed_response
      @final_results << data
    end
    @final_results
  end

  def self.final_results_with_id(results)
    # sending an id and retrieving the pairings for top 20
    @top_results = []
    suggestions = results["suggestions"]
    suggestions.each do |id|
      data = HTTParty.get(BASE_URL + "v1/suggestions/#{id}").parsed_response
      @top_results << data
    end
    @top_results
  end
end
