class Card < ActiveRecord::Base
  belongs_to :deck
  belongs_to :card_type
  attr_accessible :name, :quantity, :deck, :card_type, :cmc, :cost

  validates :quantity, numericality: { greater_than: 0 }

  def magiccards_url
    "http://magiccards.info/query?q=#{self.name}&v=card&s=cname"
  end

end
