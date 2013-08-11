class DecksController < ApplicationController
 
  def new
  end

  def show
    @deck = Deck.find(params[:id])
  end

end
