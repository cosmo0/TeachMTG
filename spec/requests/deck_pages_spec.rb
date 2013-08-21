require 'spec_helper'

describe "Deck Pages" do

  subject { page }

  describe "Deck modifications page" do
    let(:deck) { FactoryGirl.create(:deck) }
    
    before { visit edit_deck_path(deck) }

    it { should have_selector('h1', text: deck.title) }
    it { should have_selector('title', text: deck.title) }
  end

  describe "Deck modifications execution" do
    let(:deck) { FactoryGirl.create(:deck) }
    let(:initial_deck) { :deck }
  
    before { visit edit_deck_path(deck) }

    describe "with empty informations" do
      before do
        fill_in "Title", with: ""
        fill_in "Slug", with: ""
        fill_in "Category", with: ""
      end
      it "should not modify the deck" do
        expect { click_button "Edit" }.not_to change(Deck, :count)
        expect(:initial_deck).to eq :deck
      end
    end

    describe "with valid informations" do
      before do
        fill_in "Title", with: "My awesome deck"
        fill_in "Slug", with: "awesome-deck"
        fill_in "Category", with: "a"
      end
      it "should modify the deck" do
        expect { click_button "Edit" }.not_to change(Deck, :count)
        expect(:initial_deck).not_to eq :deck
      end
    end

  end

  describe "Deck details" do
    let(:deck) { FactoryGirl.create(:deck) }

    before { visit deck_path(deck) }

    it { should have_selector('h1', text: deck.title) }
    it { should have_selector('title', text: deck.title) }
    it { should have_selector('a', href: edit_deck_path(:deck)) }
  end

end
