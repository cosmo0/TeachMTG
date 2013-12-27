class DecksController < ApplicationController
  include DecksHelper

  # displays a deck
  def show
    @deck = Deck.find(params[:id])
    
    description_file = Rails.root.join("public/assets/decks/descriptions/#{@deck.slug}.md")
    if File.exist?(description_file)
      @deck_description = BlueCloth.new(File.read(description_file)).to_html.html_safe
    else
      @deck_description = "Description unavailable."
    end
  end

  # edits a deck
  def edit
    @deck = Deck.find(params[:id])

    if !view_context.user_is_admin
      redirect_to @deck, notice: "Please use an admin account to edit"
    end
  end

  # updates a deck
  def update
    @deck = Deck.find(params[:id])
    @deck.title = params[:deck][:title]
    @deck.slug = params[:deck][:slug]
    @deck.category = params[:deck][:category]
    @deck.decklist = params[:deck][:decklist]

    if @deck.save
      redirect_to @deck, notice: "Deck saved successfully"
    else
      render :edit
    end
  end

  # gets the source image from magiccard.info
  def get_image
    card_data = get_card_infos(params[:card]).css('img[src^="http://magiccards.info/scans/"]')[0]
    card_data.remove_attribute("width")
    card_data.remove_attribute("height")
    card_data.remove_attribute("style")

    # write results
    @result_image = card_data.to_s.html_safe
    render layout: false
  end

end
