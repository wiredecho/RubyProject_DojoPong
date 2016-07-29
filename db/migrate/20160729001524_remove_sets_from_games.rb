class RemoveSetsFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :sets, :integer
  end
end
