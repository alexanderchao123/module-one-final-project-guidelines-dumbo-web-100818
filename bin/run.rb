require_relative '../config/environment'

@player_one = nil
@player_two = nil

def welcome
  puts "Welcome"
end

def intitialize_players
  prompt = TTY::Prompt.new
  username_input = prompt.ask("Please enter/create your username:")
  sign_in_user(username_input)
end

def sign_in_user(name_input)
  user = User.find_by(name: name_input)
  if user
    prompt = TTY::Prompt.new
    password_input = prompt.mask("Hi #{user.name}! Please enter your password:")
    if @player_one == nil
      @player_one = user if user.check_password(password_input)
    else
      @player_two = user if user.check_password(password_input)
    end
  else
    puts "Looks like it's your first time playing"
    # puts "Please create a password"
    prompt = TTY::Prompt.new
    password_input = prompt.mask("Please create your password:")
    user = User.create(name: name_input, password: password_input)
    if @player_one == nil
      @player_one = user
    else
      @player_two = user
    end
  end
end

def select_game
  puts "Enter 1 to play Tic Tac Toe or 2 to play Connect Four"
  game_input = gets.chomp
  if game_input == "1"
    start_tic_tac_toe
  elsif game_input == "2"
    start_connect_four
  else
    puts "That's not a valid selection"
    select_game
  end
end

def start_tic_tac_toe
  board = Board.new(game_type: "tic tac toe")
  game = Game.create(player_one: @player_one, player_two: @player_two, board: board)
  game.start
end




welcome
until @player_one && @player_two
  intitialize_players
  puts "Hi Player Two" if @player_two == nil
end
select_game
