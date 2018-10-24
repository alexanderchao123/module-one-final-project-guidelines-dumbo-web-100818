class Game < ActiveRecord::Base
  belongs_to :board
  belongs_to :player_one, class_name: 'User', foreign_key: 'player_one_id'
  belongs_to :player_two, class_name: 'User', foreign_key: 'player_two_id'
  belongs_to :winner, class_name: 'User', foreign_key: 'winner_id'
  after_initialize :set_current_player


  def set_current_player
    @current_player = player_one
  end

  def current_player
    @current_player
  end

  def change_player
    @current_player == player_one ? @current_player = player_two : @current_player = player_one
  end

  def game_piece
    current_player == player_one ? "X" : "O"
  end

  def valid_move?(cell)
    cell == " "
  end

  def move(input)
    if (1..3).include?(input) && valid_move?(board.layout[0][input-1])
      board.layout[0][input-1] = game_piece
    elsif (4..6).include?(input) && valid_move?(board.layout[1][input-4])
      board.layout[1][input-4] = game_piece
    elsif (7..9).include?(input) && valid_move?(board.layout[2][input-7])
      board.layout[2][input-7] = game_piece
    else
      puts "That is not a valid input!"
      turn
    end
  end

  def turn
    puts "#{current_player.name}, it's your turn."
    puts "Pick where you would like to place your piece (1-9)"
    input = gets.chomp.to_i
    move(input)
  end

  def row_check
    checks = board.layout.select { |row| row == ["X", "X", "X"] || row == ["O", "O", "O"]}
    !checks.empty?
  end

  def column_check
    cchecks = board.layout.map.with_index do |row, index|
      !valid_move?(board.layout[0][index]) && board.layout[0][index] == board.layout[1][index] && board.layout[0][index] == board.layout[2][index]
    end
    cchecks.include?(true)
  end

  def diagonal_check
    !valid_move?(board.layout[2][0]) && board.layout[2][0] == board.layout[1][1] && board.layout[2][0] == board.layout[0][2]
  end

  def reverse_diagonal_check
    !valid_move?(board.layout[0][0]) && board.layout[0][0] == board.layout[1][1] && board.layout[0][0] == board.layout[2][2]
  end

  def full_board
    !board.layout.flatten.include?(" ")
  end

  def win?
    row_check || column_check || diagonal_check || reverse_diagonal_check
  end

  def win
    if win?
      self.winner = current_player
      self.status = "complete"
    end
  end

  def draw
    puts "It looks like a draw"
  end

  def congratulations
    puts "Congratulations #{winner.name}!!!"
  end

  def start
    until full_board || status == "complete"
      system "clear"
      board.display_board
      turn
      win
      change_player unless win
    end
    board.display_board
    winner ? congratulations : draw
  end

end
