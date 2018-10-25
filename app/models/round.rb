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
    game.set_board
    pieces = self.pieces
    pieces.each do |piece|
      game.replay_board(piece: piece)
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
