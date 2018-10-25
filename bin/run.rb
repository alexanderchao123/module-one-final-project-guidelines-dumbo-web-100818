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
  decor = TTY::Prompt.new.decorate('🐧')
  if user
    prompt = TTY::Prompt.new
    password_input = prompt.mask("Hi #{user.name}! Please enter your password:", mask:decor)
    if @player_one == nil
      @player_one = user if user.check_password(password_input)
    else
      @player_two = user if user.check_password(password_input)
    end
  else
    puts "Looks like it's your first time playing"
    prompt = TTY::Prompt.new
    password_input = prompt.mask("Please create your password:", mask:decor)
    user = User.create(name: name_input, password: password_input)
    if @player_one == nil
      @player_one = user
    else
      @player_two = user
    end
  end
end

def select_game
  system "clear"
  prompt = TTY::Prompt.new
  game_input = prompt.select("What do you want to play?", ["Tic Tac Toe", {name: "Connect Four", disabled: '(not available)'}, {name: "Chess", disabled: '(not available)'}, {name: "Checkers", disabled: '(not available)'}, "exit"])
  until game_input == "exit"
    if game_input == "Tic Tac Toe"
      start_tic_tac_toe
    elsif game_input == "Connect Four"
      start_connect_four
    end
    system "clear"
    game_input = prompt.select("What do you want to play?", ["Tic Tac Toe", {name: "Connect Four", disabled: '(not available)'}, {name: "Chess", disabled: '(not available)'}, {name: "Checkers", disabled: '(not available)'}, "exit"])
  end
end

def start_tic_tac_toe
  game = Game.all.first
  round = Round.create(game: game, player_one: @player_one, player_two: @player_two)
  round.start
end




welcome
until @player_one && @player_two
  intitialize_players
  puts "Hi Player Two" if @player_two == nil
end
select_game
