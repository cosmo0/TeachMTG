class Card < ActiveRecord::Base
  belongs_to :deck
  belongs_to :card_type
  attr_accessible :name, :quantity, :deck, :card_type, :cmc, :cost

  validates :quantity, numericality: { greater_than: 0 }
end
