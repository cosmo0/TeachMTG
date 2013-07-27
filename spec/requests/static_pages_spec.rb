require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit home_path }
    it { should have_selector('h1', :text => 'How do I teach Magic: The Gathering') }
    it { should have_selector('title', :text => "How to teach Magic: The Gathering") }
  end

  describe "Basics page" do
    before { visit basics_path }
    it { should have_selector('h1', :text => /basics/i) }
    it { should have_selector('title', :text => /basics/i) }
  end

  describe "Decks page" do
    before { visit decks_path }
    it { should have_selector('h1', :text => /decks/i) }
    it { should have_selector('title', :text => /decks/i) }
  end

  describe "Beginners page" do
    before { visit beginners_path }
    it { should have_selector('h1', :text => /beginners/i) }
    it { should have_selector('title', :text => /beginners/i) }
  end

  describe "Advanced page" do
    before { visit advanced_path }
    it { should have_selector('h1', :text => /advanced/i) }
    it { should have_selector('title', :text => /advanced/i) }
  end

  describe "Drafting page" do
    before { visit drafting_path }
    it { should have_selector('h1', :text => /drafting/i) }
    it { should have_selector('title', :text => /drafting/i) }
  end

end
