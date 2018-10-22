class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      # t.integer :wins
      # t.integer :draws
      # t.integer :games_played
      t.timestamps
    end
  end
end
