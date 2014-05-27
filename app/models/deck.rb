class Deck < ActiveRecord::Base
  include DecksHelper
  extend FriendlyId

  has_many :cards

  attr_accessible :category, :slug, :title, :cards, :description

  friendly_id :slug

  validates :title,     presence: true,
                        uniqueness: { case_sensitive: false }

  validates :slug,      presence: true,
                        uniqueness: { case_sensitive: false },
                        length: { maximum: 20 },
                        format: { with: /^[^\s]+$/ }

  validates :category,  presence: true,
                        format: { with: /[A|B]/ }

  @@decklist_regexp = /^([\d]+)[x]?[\s]+([\w\s\-',]+)$/im

  before_save do
    self.slug.downcase!
    self.category.upcase!
  end

  # list of cards for text areas
  def decklist
    list = ""
    self.cards.order(:name).each do |c|
      list += "#{c.quantity}x #{c.name}\n"
    end
    return list
  end

  # Saves the raw decklist as Cards model collection
  def decklist=(value)
    Deck.transaction do
      # first, let's empty the cards of the deck
      self.cards.clear
      # then, let's find all the cards in the :decklist field
      value.split("\n").each do |c|
        if !c.empty?
          number = @@decklist_regexp.match(c)[1].to_i
          card_name = @@decklist_regexp.match(c)[2].to_s.humanize
          
          # get the card infos
          card_infos = get_card_infos(card_name)
          raise "Card #{card_name} could not be found" if card_infos.nil?
          puts "Card infos : #{card_infos}"
          card_type = CardType.find_by_name(card_infos[:type])
          
          Card.create(name: card_name, quantity: number, deck: self, card_type: card_type, cost: card_infos[:cost], cmc: card_infos[:cmc])
        end
      end
      self.save
    end
  end

  def has_type(type)
    self.cards.joins(:card_type).where(card_types: { name: type.name }).any?
  end

  def cards_for_type(type)
    self.cards.joins(:card_type).where(card_types: { name: type.name }).order(:name)
  end

  def number_of_cards_for_type(type)
    sum = 0
    cards_for_type(type).each do |c|
      sum += c.quantity
    end
    return sum
  end

end
