require 'spec_helper'

describe "Deck" do

  subject { page }

  describe "details" do
    let(:deck) { FactoryGirl.create(:deck) }

    before { visit deck_path(deck) }

    it { should have_selector('h1', text: deck.title) }
    it { should have_selector('title', text: deck.title) }
    it { should have_selector('a', href: edit_deck_path(:deck)) }
  end

  # TODO: these tests should only succeed after login with the admin user.

  # describe "modifications page" do
  #   let(:deck) { FactoryGirl.create(:deck) }
    
  #   before { visit edit_deck_path(deck) }

  #   it { should have_selector('h1', text: deck.title) }
  #   it { should have_selector('title', text: deck.title) }
  # end

  # describe "modifications execution" do
  #   let(:deck) { FactoryGirl.create(:deck) }
  #   let(:initial_deck) { deck }
  
  #   before { visit edit_deck_path(deck) }

  #   describe "with empty informations" do
  #     before do
  #       fill_in "Title", with: ""
  #       fill_in "Slug", with: ""
  #       fill_in "Category", with: ""
  #     end
  #     describe "should not modify the deck" do
  #       subject { -> { click_button "Edit" } }
  #       it { should_not change(Deck, :count) }
  #       # TODO: test the equity between deck and initial_deck
  #     end
  #   end

  #   describe "with valid informations" do
  #     before do
  #       fill_in "Title", with: "My awesome modified deck"
  #       fill_in "Slug", with: "awesome-deck"
  #       fill_in "Category", with: "A"
  #     end
  #     describe "should modify the deck" do
  #       subject { -> { click_button "Edit" } }
  #       it { should_not change(Deck, :count) }
  #       # TODO: test the non-equity between deck and initial_deck
  #     end
  #   end

  # end

end
