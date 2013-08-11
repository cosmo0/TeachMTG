class StaticPagesController < ApplicationController

  def home
  end

  # What and how to teach

  def basics
  end

  def world
  end

  def philosophies
  end

  def rules
  end

  # Simple and cheap decks

  def concepts
  end

  def beginners
    @decks = Deck.find_all_by_category('B')
  end

  def advanced
    @decks = Deck.find_all_by_category('A')
  end

  # Drafting

  def drafting
  end

  # Infos

  def resources
  end

end
