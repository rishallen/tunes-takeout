class SuggestionsController < ApplicationController
  def index

  end

  def favorites
  end

  def new
    @suggestion = Suggestion.new
    render :new  
  end

  def unfavorite
  end
end
