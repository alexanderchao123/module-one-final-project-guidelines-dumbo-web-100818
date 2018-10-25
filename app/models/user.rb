class User < ActiveRecord::Base
  has_many :rounds_as_player_one,  class_name: "Round", foreign_key: "player_one_id"
  has_many :rounds_as_player_two,  class_name: "Round", foreign_key: "player_two_id"
  has_many :pieces, through: :rounds
  has_many :games, through: :rounds

  def check_password(password_input)
    self.password == password_input
  end

  def rounds
    rounds = rounds_as_player_one + rounds_as_player_two
    rounds.sort_by {|round| round.id}
  end
end
