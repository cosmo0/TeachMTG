require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: page_title) }
  end

  describe "Home page" do
    before { visit home_path }
    let(:heading) { 'How do I teach Magic: The Gathering' }
    let(:page_title) { 'How to teach Magic: The Gathering' }

    it_should_behave_like "all static pages"
  end

  # BASICS

  describe "Basics page" do
    before { visit basics_path }
    let(:heading) { /basic/i }
    let(:page_title) { /basic/i }

    it_should_behave_like "all static pages"
  end

  describe "World page" do
    before { visit world_path }
    let(:heading) { /world/i }
    let(:page_title) { /world/i }

    it_should_behave_like "all static pages"
  end

  describe "Philosophies page" do
    before { visit philosophies_path }
    let(:heading) { /philosophies/i }
    let(:page_title) { /philosophies/i }

    it_should_behave_like "all static pages"
  end

  describe "Rules page" do
    before { visit rules_path }
    let(:heading) { /rules/i }
    let(:page_title) { /rules/i }

    it_should_behave_like "all static pages"
  end

  # DECKS

  describe "Decks page" do
    before { visit decks_path }
    let(:heading) { /decks/i }
    let(:page_title) { /decks/i }

    it_should_behave_like "all static pages"
  end

  describe "Beginners page" do
    before { visit beginners_path }
    let(:heading) { /beginners/i }
    let(:page_title) { /beginners/i }

    it_should_behave_like "all static pages"
  end

  describe "Advanced page" do
    before { visit advanced_path }
    let(:heading) { /advanced/i }
    let(:page_title) { /advanced/i }

    it_should_behave_like "all static pages"
  end

  # DRAFTING

  describe "Drafting page" do
    before { visit drafting_path }
    let(:heading) { /drafting/i }
    let(:page_title) { /drafting/i }

    it_should_behave_like "all static pages"
  end

  # INFOS

  describe "Resources page" do
    before { visit resources_path }
    let(:heading) { /resources/i }
    let(:page_title) { /resources/i }

    it_should_behave_like "all static pages"
  end

end
