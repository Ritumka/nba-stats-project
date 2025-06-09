class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :team_id
      t.float :points_per_game
      t.float :assists_per_game
      t.integer :rebounds_per_game

      t.timestamps
    end
  end
end
