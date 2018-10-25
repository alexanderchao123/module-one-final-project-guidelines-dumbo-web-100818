class CreatePieces < ActiveRecord::Migration[5.0]
  def change
    create_table :pieces do |t|
      t.string :piece_type
      t.string :placement
      t.integer :round_id
      t.integer :user_id
      t.timestamps
    end
  end
end
