class User < ActiveRecord::Base
  has_many :games
  has_many :boards, through: :games

  def check_password(password_input)
    self.password == password_input
  end
end
