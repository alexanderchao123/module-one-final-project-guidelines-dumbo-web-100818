class Round < ActiveRecord::Base
  belongs_to :game
  belongs_to :player_one, class_name: 'User', foreign_key: 'player_one_id'
  belongs_to :player_two, class_name: 'User', foreign_key: 'player_two_id'
  belongs_to :winner, class_name: 'User', foreign_key: 'winner_id'
  has_many :pieces

  def start
    game.start(round: self)
  end

end
