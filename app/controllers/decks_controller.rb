class DecksController < ApplicationController
 
  def new
  end

  def show
    @deck = Deck.find(params[:id])
    
    @deck_description = BlueCloth.new(File.read(
        Rails.root.join("public/assets/decks/descriptions/#{@deck.slug}.md")
      )).to_html.html_safe

    @deck_list = File.read(
        Rails.root.join("public/assets/decks/decklists/#{@deck.slug}.deck")
      )
  end

end
