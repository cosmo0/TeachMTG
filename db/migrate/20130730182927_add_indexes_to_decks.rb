class AddIndexesToDecks < ActiveRecord::Migration
  def change
    add_index :decks, :title, unique: true
    add_index :decks, :slug, unique: true
  end
end
