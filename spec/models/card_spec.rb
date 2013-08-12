require 'spec_helper'

describe "Card model" do
  before do
    d = Deck.find(1) 
    t = CardType.find_by_name("Land")

    @card = Card.new name: "plains", quantity: "24", deck: d, card_type: t
  end

  subject { @card }

  describe "when members exist" do
    it { should respond_to(:name) }
    it { should respond_to(:quantity) }
    it { should respond_to(:deck) }
    it { should respond_to(:card_type) }
  end

  describe "when quantity is 0" do
    before { @card.quantity = 0 }
    
    it { should_not be_valid }
  end

end
