require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit home_path }
    it { should have_selector('h1', :text => 'How do I teach Magic: The Gathering') }
    it { should have_selector('title', :text => "How to teach Magic: The Gathering") }
  end

  # BASICS

  describe "Basics page" do
    before { visit basics_path }
    it { should have_selector('h1', :text => /basic/i) }
    it { should have_selector('title', :text => /basic/i) }
  end

  describe "World page" do
    before { visit world_path }
    it { should have_selector('h1', :text => /world/i) }
    it { should have_selector('title', :text => /world/i) }
  end

  describe "Philosophies page" do
    before { visit philosophies_path }
    it { should have_selector('h1', :text => /philosophies/i) }
    it { should have_selector('title', :text => /philosophies/i) }
  end

  describe "Rules page" do
    before { visit rules_path }
    it { should have_selector('h1', :text => /rules/i) }
    it { should have_selector('title', :text => /rules/i) }
  end

  # DECKS

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

  # DRAFTING

  describe "Drafting page" do
    before { visit drafting_path }
    it { should have_selector('h1', :text => /drafting/i) }
    it { should have_selector('title', :text => /drafting/i) }
  end

  # INFOS

  describe "Resources page" do
    before { visit resources_path }
    it { should have_selector('h1', :text => /resources/i) }
    it { should have_selector('title', :text => /resources/i) }
  end

end
