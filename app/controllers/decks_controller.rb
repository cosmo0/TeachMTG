class DecksController < ApplicationController

  def show
    @deck = Deck.find(params[:id])
    
    description_file = Rails.root.join("public/assets/decks/descriptions/#{@deck.slug}.md")
    if File.exist?(description_file)
      @deck_description = BlueCloth.new(File.read(description_file)).to_html.html_safe
    else
      @deck_description = "Description unavailable."
    end
  end

  def edit
    @deck = Deck.find(params[:id])

    if !view_context.user_is_admin
      redirect_to @deck, notice: "Please use an admin account to edit"
    end
  end

  def update
    @deck = Deck.find(params[:id])
    @deck.title = params[:deck][:title]
    @deck.slug = params[:deck][:slug]
    @deck.category = params[:deck][:category]

    if @deck.save
      redirect_to @deck, notice: "Deck saved successfully"
    else
      render :edit
    end
  end

end
