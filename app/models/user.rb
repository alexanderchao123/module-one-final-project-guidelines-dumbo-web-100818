class User < ActiveRecord::Base
  has_many :rounds, foreign_key: "player_one_id", class_name: "Round"
  has_many :rounds, foreign_key: "player_two_id", class_name: "Round"
  has_many :pieces, through: :rounds
  has_many :games, through: :rounds

  def check_password(password_input)
    self.password == password_input
  end
end
