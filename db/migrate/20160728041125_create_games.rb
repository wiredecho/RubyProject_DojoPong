class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :winner
      t.references :loser
      t.integer :wscore
      t.integer :lscore
      t.integer :sets

      t.timestamps null: false
    end
  end
end
