class User < ActiveRecord::Base

has_many :games
has_many :boards, through: :games



end