class Deck < ActiveRecord::Base
  extend FriendlyId

  has_many :cards

  attr_accessible :category, :slug, :title, :cards

  friendly_id :slug

  validates :title,     presence: true,
                        uniqueness: { case_sensitive: false }

  validates :slug,      presence: true,
                        uniqueness: { case_sensitive: false },
                        length: { maximum: 20 },
                        format: { with: /^[^\s]+$/ }

  validates :category,  presence: true,
                        format: { with: /[A|B]/ }

  @@decklist_regexp = /^([\d]+)[x]?[\s]+([\w\s'-,]+)$/im

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

  # Saves the decklist as Cards model
  def decklist=(value)
    Deck.transaction do
      # first, let's empty the cards of the deck
      self.cards.clear
      # then, let's find all the cards in the decklist field
      value.split("\n").each do |c|
        number = @@decklist_regexp.match(c)[1].to_i
        card_name = @@decklist_regexp.match(c)[2].to_s.titleize
        
        # get the card type through magiccards.info
        card_type = CardType.find_by_name "Undefined" # TODO: find the card type by going through online tools like magiccards.info
        
        Card.create(name: card_name, quantity: number, deck: self, card_type: card_type)
      end
      self.save
    end
  end

end
