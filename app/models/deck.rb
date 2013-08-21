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

  before_save do
    self.slug.downcase!
    self.category.upcase!
  end

end
