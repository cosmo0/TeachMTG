require 'spec_helper'

describe "Deck Pages" do

  subject { page }

  describe "Deck modifications" do
    let(:deck) { FactoryGirl.create(:deck) }
    
    before { visit edit_deck_path(deck) }

    it { should have_selector('h1', text: deck.title) }
    it { should have_selector('title', text: deck.title) }
  end

  describe "Deck details" do
    let(:deck) { FactoryGirl.create(:deck) }

    before { visit deck_path(deck) }

    it { should have_selector('h1', text: deck.title) }
    it { should have_selector('title', text: deck.title) }
  end

end
