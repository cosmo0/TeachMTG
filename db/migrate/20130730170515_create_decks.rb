class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :title
      t.string :category
      t.string :description_file
      t.text :decklist

      t.timestamps
    end
  end
end
