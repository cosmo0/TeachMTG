class Card < ActiveRecord::Base
  
  attr_accessible :id, :name
  belongs_to :deck
  
end