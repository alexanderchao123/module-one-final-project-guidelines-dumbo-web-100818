class Game < ActiveRecord::Base
  has_many :rounds
  has_many :users, through: :rounds
  after_initialize :set_board, :set_current_player
  attr_accessor :board

  def set_board
    @board = tic_tac_toe
  end

  def display_board
    board.each_with_index do |row, index|
      puts row.join("|")
    end
  end

  def tic_tac_toe
    [
      [" ", " ", " "],
      [" ", " ", " "],
      [" ", " ", " "]
    ]
  end

  # def set_current_player
  #   @current_player = player_one
  # end
  #
  # def current_player
  #   @current_player
  # end
  #
  # def change_player
  #   @current_player == player_one ? @current_player = player_two : @current_player = player_one
  # end

  def game_piece
    current_player == player_one ? "X" : "O"
  end

  def valid_move?(cell)
    cell == " "
  end

  def move(input)
    if (1..3).include?(input) && valid_move?(board[0][input-1])
      board[0][input-1] = game_piece
    elsif (4..6).include?(input) && valid_move?(board[1][input-4])
      board[1][input-4] = game_piece
    elsif (7..9).include?(input) && valid_move?(board[2][input-7])
      board[2][input-7] = game_piece
    else
      puts "That is not a valid input!"
      turn
    end
  end

  def turn
    puts "#{current_player.name}, it's your turn."
    # puts "Pick where you would like to place your piece (1-9)"
    # input = gets.chomp.to_i
    prompt = TTY::Prompt.new
    input = prompt.select("Pick where you would like to place your piece:", ["1", "2", "3", "4", "5", "6", "7", "8", "9"], per_page: 9)
    move(input.to_i)
  end

  def row_check
    checks = board.select { |row| row == ["X", "X", "X"] || row == ["O", "O", "O"]}
    !checks.empty?
  end

  def column_check
    cchecks = board.map.with_index do |row, index|
      !valid_move?(board[0][index]) && board[0][index] == board[1][index] && board[0][index] == board[2][index]
    end
    cchecks.include?(true)
  end

  def diagonal_check
    !valid_move?(board[2][0]) && board[2][0] == board[1][1] && board[2][0] == board[0][2]
  end

  def reverse_diagonal_check
    !valid_move?(board[0][0]) && board[0][0] == board[1][1] && board[0][0] == board[2][2]
  end

  def full_board
    !board.flatten.include?(" ")
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
      display_board
      turn
      win
      change_player unless win
    end
    display_board
    winner ? congratulations : draw
  end

end
