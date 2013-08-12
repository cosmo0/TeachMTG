require 'spec_helper'

describe "Deck Model" do
  before { @deck = Deck.new title: "White test", category: "B", slug: "white-test" }

  subject { @deck }

  describe "when members exist" do
    it { should respond_to(:title) }
    it { should respond_to(:category) }
    it { should respond_to(:slug) }
  end

  describe "when title is not present" do
    before { @deck.title = " " }
    it { should_not be_valid }
  end

  describe "when category is not present" do
    before { @deck.category = " " }
    it { should_not be_valid }
  end

  describe "when category is invalid" do
    before { @deck.category = "c" }
    it { should_not be_valid }
  end

  describe "when slug is not present" do
    before { @deck.slug = " " }
    it { should_not be_valid }
  end

  describe "when slug is too long" do
    before { @deck.slug = "This-is-a-title-instead-of-a-slug" }
    it { should_not be_valid }
  end

  describe "when slug has spaces" do
    before { @deck.slug = "This is a title" }
    it { should_not be_valid }
  end

  describe "when a deck with same data already exists" do
    before do
      deck_with_same_data = @deck.dup
      deck_with_same_data.title = @deck.title.upcase
      deck_with_same_data.slug = @deck.slug.upcase
      deck_with_same_data.save
    end

    it { should_not be_valid }
  end

end
