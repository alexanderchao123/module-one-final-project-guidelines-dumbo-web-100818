class Board < ActiveRecord::Base
  attr_accessor :layout

  has_many :games
  has_many :users, through: :games
  after_initialize :set_layout

  def set_layout
    @layout = tic_tac_toe if game_type == "tic tac toe"
    @layout = connect_four if game_type == "connect four"
  end

  def display_board
    layout.each_with_index do |row, index|
      puts row.join("|")
      # puts "-------------" * layout.length * 4 if index < (layout.length - 1)
    end
  end

  def tic_tac_toe
    [
      [" ", " ", " "],
      [" ", " ", " "],
      [" ", " ", " "]
    ]
  end

  def connect_four
    [
      [" ", " ", " ", " ", " ", " ", " "],
      [" ", " ", " ", " ", " ", " ", " "],
      [" ", " ", " ", " ", " ", " ", " "],
      [" ", " ", " ", " ", " ", " ", " "],
      [" ", " ", " ", " ", " ", " ", " "],
      [" ", " ", " ", " ", " ", " ", " "],
    ]
  end

end
