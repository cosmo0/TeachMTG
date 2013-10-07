class Deck < ActiveRecord::Base
  extend FriendlyId

  has_many :cards
  # accepts_nested_attributes_for :cards
  attr_accessible :category, :slug, :title, :cards, :deck_list

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
    set_cards
  end

  def set_cards
    self.cards.build unless self.cards.present?
    list = self.deck_list.split('\n')
    list.each do |item|
      card = item.split('x ')
      self.cards.create(name: card.last, quantity: card.first)
    end
  end

end
