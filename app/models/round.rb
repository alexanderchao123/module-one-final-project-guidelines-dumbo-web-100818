class Round < ActiveRecord::Base
  belongs_to :game
  belongs_to :player_one, class_name: 'User', foreign_key: 'player_one_id'
  belongs_to :player_two, class_name: 'User', foreign_key: 'player_two_id'
  belongs_to :winner, class_name: 'User', foreign_key: 'winner_id'
  has_many :pieces

  def play_again
    input = PROMPT.select("What would you like to do?", ["play again", "exit"])
    exit if input == "exit"
  end

  def replay
    # assemble the pieces pertaining to the round
    pieces = self.pieces
    # go through the array of pieces and pass each piece into a move method to populate and display the board
    pieces.each do |piece|
      # move method would use the piece instance and call the piece's piece_type and placement
      game.replay_board(piece: piece)
      # binding.pry
      game.display_board
      sleep(1)
    end
    return nil
  end

  def start
    game.start(round: self)
    sleep(1)
    play_again
  end

end
