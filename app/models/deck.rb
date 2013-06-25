class Deck < ActiveRecord::Base
  
  attr_accessible :id, :name, :intro, :description
  
  has_many :cards
  
end