class AddIndexesToDecks < ActiveRecord::Migration
  def change
    add_index :decks, :title, unique: true
    add_index :decks, :description_file, unique: true
  end
end
