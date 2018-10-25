require_relative '../config/environment'

@player_one = nil
@player_two = nil

def welcome
  system "clear"
  puts "Welcome"
end

def intitialize_players
  username_input = PROMPT.ask("Please enter/create your username:")
  sign_in_user(username_input)
end

def sign_in_user(name_input)
  user = User.find_by(name: name_input)
  decor = TTY::Prompt.new.decorate('🐧')
  if user
    password_input = PROMPT.mask("Hi #{user.name}! Please enter your password:", mask:decor)
    if @player_one == nil
      @player_one = user if user.check_password(password_input)
    else
      @player_two = user if user.check_password(password_input)
    end
  else
    puts "Looks like it's your first time playing"
    password_input = PROMPT.mask("Please create your password:", mask:decor)
    user = User.create(name: name_input, password: password_input)
    if @player_one == nil
      @player_one = user
    else
      @player_two = user
    end
  end
end

def select_menu
  system "clear"
  select_array = ["Tic Tac Toe", {name: "Connect Four", disabled: '(not available)'}, {name: "Chess", disabled: '(not available)'}, {name: "Checkers", disabled: '(not available)'}, "View #{@player_one.name}'s Profile", "View #{@player_two.name}'s Profile", "Exit"]
  game_input = PROMPT.select("What do you want to play?", select_array)
  until game_input == "Exit"
    if game_input == "Tic Tac Toe"
      start_tic_tac_toe
    elsif game_input == "View #{@player_one.name}'s Profile"
      profile_input = ""
      until profile_input == "Back"
        system "clear"
        puts "Wins: #{@player_one.wins}"
        puts ""
        puts ""
        puts ""
        profile_input = PROMPT.select("Pick a game to view replay or return to Main Menu", ["Game #{past_rounds(@player_one)[0].id}", "Game #{past_rounds(@player_one)[1].id}", "Game #{past_rounds(@player_one)[2].id}", "Main Menu"])
      end
    elsif game_input == "View #{@player_two.name}'s Profile"
      puts "Wins: #{@player_one.wins}"
    end
    system "clear"
    game_input = PROMPT.select("What do you want to play?", select_array)
  end
  system "clear"
end

def past_rounds(user)
  user.rounds.last(3)
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
select_menu
