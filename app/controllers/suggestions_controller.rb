require 'tunestakeout'

class SuggestionsController < ApplicationController
  def index
    @param_results = TunesTakeout.search(params[:search])
  end

  def favorites
    # @user = Suggestion.find(params[:number])
  end

  # def show
  # individual item
  #   @param_results = TunesTakeout.search(params[:search])
  # end

  def unfavorite
  end
end
