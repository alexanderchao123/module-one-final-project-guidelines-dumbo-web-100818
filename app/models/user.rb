class User < ActiveRecord::Base
  has_many :rounds
  has_many :games, through: :rounds

  def check_password(password_input)
    self.password == password_input
  end
end
