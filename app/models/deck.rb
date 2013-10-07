class Deck < ActiveRecord::Base
  extend FriendlyId

  has_many :cards

  attr_accessible :category, :slug, :title, :cards
  attr_accessor :decklist

  friendly_id :slug

  validates :title,     presence: true,
                        uniqueness: { case_sensitive: false }

  validates :slug,      presence: true,
                        uniqueness: { case_sensitive: false },
                        length: { maximum: 20 },
                        format: { with: /^[^\s]+$/ }

  validates :category,  presence: true,
                        format: { with: /[A|B]/ }

  before_save do
    self.slug.downcase!
    self.category.upcase!
    # set_decklist
  end

  # list of cards for text areas
  def decklist
    list = ""
    self.cards.each do |c|
      list += "#{c.quantity}x #{c.name}\n"
    end
    logger.debug("DECKLIST READER " + list)
    @decklist = list
    list
  end

  # Saves the decklist as Cards model
  def decklist=(value)
    logger.debug("DECKLIST WRITER " + value)
    @decklist = value
    list = Array.new
    value.split(" ").each do |c|
      list << c
    end
  end

  # def set_decklist
  #   logger.debug("DECKLIST SET " + self.decklist)
  #   self.cards.build unless self.cards.present?
  #   list = self.decklist.split('\n')
  #   list.each do |item|
  #     # card = item.split('x ')
  #     # self.cards.create(name: card.last, quantity: card.first)
  #   end
  # end

end
