class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.integer :cell_one
      t.integer :cell_two
      t.integer :cell_three
      t.integer :cell_four
      t.integer :cell_five
      t.integer :cell_six
      t.integer :cell_seven
      t.integer :cell_eight
      t.integer :cell_nine
      t.timestamps
    end
  end
end
