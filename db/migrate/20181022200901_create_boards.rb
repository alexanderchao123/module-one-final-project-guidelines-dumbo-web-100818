class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.string :game_type
      t.string :row_one
      t.string :row_two
      t.string :row_three
      t.string :row_four
      t.string :row_five
      t.string :row_six
      t.timestamps
    end
  end
end
