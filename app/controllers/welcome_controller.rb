require_relative '../../lib/TunesTakeout'

class WelcomeController < ApplicationController
  def index
    @results = TunesTakeout.top_favorites_by
    @final_results = TunesTakeout.final_results(@results)
    @top_results = Music.charles_api_hash(@final_results)
  end
end
