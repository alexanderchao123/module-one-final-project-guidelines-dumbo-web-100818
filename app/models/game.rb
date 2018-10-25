class Game < ActiveRecord::Base
  has_many :rounds
  has_many :users, through: :rounds
  after_initialize :set_board
  attr_accessor :board

  def set_board
    @board = tic_tac_toe
  end

  def tic_tac_toe
    [
      [" ", " ", " "],
      [" ", " ", " "],
      [" ", " ", " "]
    ]
  end

  def display_board
    system "clear"
    board.each_with_index do |row, index|
      puts row.join("||")
      puts "-------" if index < board.length - 1
    end
  end

  def set_current_player(player:)
    @current_player = player
  end

  def current_player
    @current_player
  end

  def change_player(round:)
    @current_player == round.player_one ? @current_player = round.player_two : @current_player = round.player_one
  end

  def game_piece(round:)
    current_player == round.player_one ? "X" : "O"
  end

  def valid_move?(cell)
    cell == " "
  end

  def save(round:)
    round.update(status: "save")
  end

  def forfeit(round:)
    round.update(status: "forfeit")
  end

  def quit(round:)
    input = PROMPT.select("Do you want to save or forfeit", ["save", "forfeit", "cancel"])
    if input == "save"
      save(round: round)
    elsif input == "forfeit"
      forfeit(round: round)
    end
  end

  def move(round:, player: current_player, position:)
    if (1..3).include?(position) && valid_move?(board[0][position-1])
      piece = Piece.create(round: round, user: player, placement: position, piece_type: game_piece(round: round))
      board[0][position-1] = piece.piece_type
    elsif (4..6).include?(position) && valid_move?(board[1][position-4])
      piece = Piece.create(round: round, user: player, placement: position, piece_type: game_piece(round: round))
      board[1][position-4] = piece.piece_type
    elsif (7..9).include?(position) && valid_move?(board[2][position-7])
      piece = Piece.create(round: round, user: player, placement: position, piece_type: game_piece(round: round))
      board[2][position-7] = piece.piece_type
    elsif position == 0
      quit(round: round)
    else
      display_board
      puts "Invalid input"
      turn(round: round)
    end
  end

  def turn(round:)
    puts "#{current_player.name}, it's your turn."
    input = PROMPT.select("Pick where you would like to place your piece:", ["1", "2", "3", "4", "5", "6", "7", "8", "9", "exit"], per_page: 10)
    move(round: round, position: input.to_i)
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

  def set_winner(round:)
    round.update(winner: current_player)
    round.update(status: "complete")
    round.winner.update(wins: round.winner.wins += 1)
  end

  def save_message
    puts "This game has saved"
  end

  def forfeit_message
    puts "This game has been forfeited"
  end

  def draw_message
    puts "It looks like a draw!"
  end

  def congratulations_message(round:)
    puts "Congratulations #{round.winner.name}, you're the winner!!!"
  end

  def start(round:)
    set_current_player(player: round.player_one)
    until full_board || round.status == "complete" || round.status == "forfeit" || round.status == "save"
      display_board
      turn(round: round)
      set_winner(round: round) if win?
      change_player(round: round) unless win?
    end
    display_board
    if round.status == "save"
      save_message
    elsif round.status == "forfeit"
      forfeit_message
    elsif round.winner
      congratulations_message(round: round)
    else
      draw_message
    end
  end

  def replay_board(piece:)
    position = piece.placement.to_i
    if (1..3).include?(position)
      board[0][position-1] = piece.piece_type
    elsif (4..6).include?(position)
      board[1][position-4] = piece.piece_type
    elsif (7..9).include?(position)
      board[2][position-7] = piece.piece_type
    end
  end

end
