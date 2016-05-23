require_relative '../../lib/tunestakeoutwrapper.rb'

class SuggestionsController < ApplicationController
  def index
  end

  def add_favorite
    @suggestion = params["suggestion"]
    @user = current_user.uid
    favorites = TunesTakeout.add_a_favorite(@user, @suggestion)
    redirect_to root_path
    #to do -- pass suggestion and user id to tunes-takeout-api and call the post url
  end

  def favorite
    @suggestion = params["suggestion"]
    @user = current_user.uid
    response = TunesTakeoutWrapper.favorite(@user, @suggestion)
    redirect_to root_path
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
