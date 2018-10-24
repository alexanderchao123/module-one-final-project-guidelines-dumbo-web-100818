class CreateRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.integer :game_id
      t.integer :player_one_id
      t.integer :player_two_id
      t.integer :winner_id
      t.string  :status, default: "in progress"
      t.timestamps
    end
  end
end
