require 'spec_helper'

describe "CardType model" do
  before { @type = CardType.new name: "Enchantment" }

  subject { @type }

  describe "when members exist" do
    it { should respond_to(:name) }
  end
end
