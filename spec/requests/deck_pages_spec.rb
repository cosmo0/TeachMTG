require 'spec_helper'

describe "DeckPages" do

  subject { page }

  describe "Deck creation" do
    before { visit '/decks/new' }
    it { should have_selector('h1', text: /new deck/i) }
    it { should have_selector('title', text: /new deck/i) }
  end

  # describe "Deck display" do
  #   before { visit 'decks/show/1' }    
  # end

end
