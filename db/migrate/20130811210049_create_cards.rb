class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :quantity
      t.references :deck
      t.references :card_type

      t.timestamps
    end
    add_index :cards, :deck_id
    add_index :cards, :card_type_id
  end
end
