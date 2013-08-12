require 'spec_helper'

describe "Card model" do
  before { @card = Card.new name: "plains", quantity: "24",
    deck: Deck.find(1), card_type: CardType.find_by_name(/land/i) }

  subject { @card }

  describe "when members exist" do
    it { should respond_to(:name) }
    it { should respond_to(:quantity) }
    it { should respond_to(:deck) }
    it { should respond_to(:card_type) }
  end
end
