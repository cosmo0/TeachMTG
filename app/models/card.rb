class Card < ActiveRecord::Base
  belongs_to :deck
  belongs_to :card_type
  attr_accessible :name, :quantity
end
