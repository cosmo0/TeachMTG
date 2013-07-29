require 'spec_helper'

describe "UserPages" do

  subject { page }

  describe "Deck creation" do
    before { visit '/decks/new' }
    it { should have_selector('h1', text: /new deck/i) }
    it { should have_selector('title', text: /new deck/i) }
  end

end
