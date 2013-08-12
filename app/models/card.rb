class Card < ActiveRecord::Base
  belongs_to :deck
  belongs_to :card_type
  attr_accessible :name, :quantity, :deck, :card_type

  validates :quantity, numericality: { greater_than: 0 }
end
