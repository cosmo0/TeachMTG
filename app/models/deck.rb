class Deck < ActiveRecord::Base
  attr_accessible :category, :slug, :title

  before_save do
    self.slug.downcase!
    self.category.upcase!
  end

  validates :title,     presence: true,
                        uniqueness: { case_sensitive: false }

  validates :slug,      presence: true,
                        uniqueness: { case_sensitive: false },
                        length: { maximum: 20 }

  validates :category,  presence: true

  validates_format_of :slug, :with => /^[^\s]+$/
end