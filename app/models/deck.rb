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
                        length: { maximum: 20 },
                        format: { with: /^[^\s]+$/ }

  validates :category,  presence: true,
                        format: { with: /[A|B]/ }

end
