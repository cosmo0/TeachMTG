require 'spec_helper'

describe Deck do
  before { @deck = Deck.new title: "White", category: "B", description_file: "white.md", decklist: "1x angel's tomb
1x Angelic Armaments
1x angelic skirmisher
2x auramancer
2x bonds of faith
4x call to serve
4x elite vanguard
4x ethereal armor
1x excommunicate
2x fencing ace
1x mesa enchantress
2x Pacifism
24x Plains
2x Rebuke
1x solemn offering
2x sphere of safety
1x sunblast angel
1x thran golem
4x trained caracal" }

  subject { @deck }

  it { should respond_to(:title) }
  it { should respond_to(:category) }
  it { should respond_to(:description_file) }
  it { should respond_to(:decklist) }

  describe "when title is not present" do
    before { @deck.title = " " }
    it { should_not be_valid }
  end

  describe "when category is not present" do
    before { @deck.category = " " }
    it { should_not be_valid }
  end

  describe "when description_file is not present" do
    before { @deck.description_file = " " }
    it { should_not be_valid }
  end

  describe "when decklist is not present" do
    before { @deck.decklist = " " }
    it { should_not be_valid }
  end

  describe "when description_file is too long" do
    before { @deck.description_file = "This is a description instead of a description file. This is wrong." }
    it { should_not be_valid }
  end

  describe "when a deck with same data already exists" do
    before do
      deck_with_same_data = @deck.dup
      deck_with_same_data.title = @deck.title.upcase
      deck_with_same_data.description_file = @deck.description_file.upcase
      deck_with_same_data.save
    end

    it { should_not be_valid }
  end

end
