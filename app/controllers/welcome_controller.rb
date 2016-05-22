require_relative '../../lib/tunestakeoutwrapper.rb'

class WelcomeController < ApplicationController
  def index
    @results = TunesTakeout.top_favorites_by
    @final_results = TunesTakeout.final_results_with_id(@results)
    @top_results = Music.charles_api_hash(@final_results)
  end
end
