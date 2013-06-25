class Card < ActiveRecord::Base
  
  attr_accessible :id, :name, :quantity
  
  belongs_to :deck
  
end