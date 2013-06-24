class Deck < ActiveRecord::Base
  
  attr_accessible :id, :name
  has_many :cards
  
end