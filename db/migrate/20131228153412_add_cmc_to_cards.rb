class AddCmcToCards < ActiveRecord::Migration
  def change
    add_column :cards, :cmc, :int
    add_column :cards, :cost, :string
  end
end
