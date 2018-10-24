class CreatePieces < ActiveRecord::Migration[5.0]
  def change
    create_table :pieces do |t|
      t.string :piece_type
      t.integer :round_id
      t.string :placement
    end
  end
end
