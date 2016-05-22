require_relative '../../lib/tunestakeoutwrapper.rb'

class SuggestionsController < ApplicationController
  def index
  end

  def favorites
    @user = Suggestion.find(params[:number])
  end

  def search
    # this method is sending the request to Charles Api and saving in the param_results
    if (params[:search])
      @param_results = TunesTakeout.search(params[:search])
    else
      @param_results = TunesTakeout.search("strawberries")
    end
      @final_results = TunesTakeout.final_results(@param_results)
      @top_results = Music.charles_api_hash(@final_results)
  end

  def unfavorite
  end
end
