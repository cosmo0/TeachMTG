class DecksController < ApplicationController

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
    require 'open-uri'
    require 'uri'

    # builds URL
    card_name = URI.encode(params[:card])
    url = "http://magiccards.info/query?q=!#{card_name}&v=card&s=cname"
    puts url

    # get data
    data = Nokogiri::HTML(open(url))
    image_url = data.css('img[src^="http://magiccards.info/scans/"]')

    # write results
    @result_image = image_url[0].to_s.html_safe
    render layout: false
  end

end
