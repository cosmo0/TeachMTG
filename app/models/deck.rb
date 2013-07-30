class Deck < ActiveRecord::Base
  attr_accessible :category, :decklist, :description_file, :title

  validates :title, presence: true
  validates :category, presence: true
  validates :decklist, presence: true
  validates :description_file, presence: true
end
