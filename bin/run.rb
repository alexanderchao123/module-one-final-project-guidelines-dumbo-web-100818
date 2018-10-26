require_relative '../config/environment'

@player_one = nil
@player_two = nil

pid = fork{exec 'afplay' , "./music/intro.mp3" }
sleep(1.0/2.0)

#
system "clear"
puts " █   █╗ ██╗     ██   █ ╗█ ╗  █ ╗     ██ ██╗   █╗   ██╗██   █╗      ██ █ ╗ █ █╗   ██╗██   █╗ █ ╗   █ ╗
 █╔══█ ╗ █║     █ ╔════╝╚█ ╗█ ╔      █╔══█ ╗██ █╗  █ ║██╔══██╗    ██╔══█ ╗█ █    █  ██╔══██╗╚██╗ █ ╔╝
█ █   █║ █║     ██  █╗   ╚  █╔      █ ██ █║█ ╔ █╗ ██  █║  ██║    ██   █ ║██╔█ ╗ ██  █║  ██║ ╚█  █╔╝
█ ╔══█ ║█ ║      █╔══╝    █╔█ ╗      █╔   █║█ ║╚ █╗█  ██║  ██║     █╔═  █║ █║╚█ ╗██║██║  ██║  ╚█ ╔╝
█ ║  █ ║█  █  █╗ ██   █╗█ ╔╝  █╗    █ ║   █║ █║ ╚█ █      █ ╔╝    █ ║  ██║█ ║ ╚█   ║    ██╔╝   █ ║
╚ ╝  ╚═╝╚══════╝╚══════╝╚═   ╚═     ╚ ╝  ╚═╝╚ ╝  ╚   ╝╚═  ══╝     ╚ ╝  ╚═╝╚═╝  ╚═  ╝  ══  ╝    ╚═╝
                    █   ██╗ █     ╗ ██   ██╗██   ██╗█  █  █╗█ █╗   ██╗███   ██╗
                     █╔══██╗██╔══██╗██╔════╝██╔════╝██╔════╝    ╗   █║╚══██ ══╝
                    ██   █╔╝ █ █ █╔╝█   █╗  ██   ██╗   ██╗  █ ╔██╗ █ ║   ██
                     █╔═══╝ █ ╔ ═ █╗██╔══╝  ╚════██║██╔══╝  █ ║╚██╗██║   ██
                     █║     █ ║  █ ║██   ██╗██   ██║█   ███╗█ ║ ╚   █║   ██
                    ╚ ╝     ╚ ╝  ╚═ ╚ ═ ═ ═╝╚═    ╝╚═   ══╝╚ ╝  ╚═      ╚═╝
                                                                                                         "

sleep(1.0/3.0)
system "clear"

puts " █████╗ ██╗     ███████╗██╗  ██╗     █████╗ ███╗   ██╗██████╗      █████╗ ███╗   ██╗██████╗ ██╗   ██╗
██╔══██╗██║     ██╔════╝╚██╗██╔╝    ██╔══██╗████╗  ██║██╔══██╗    ██╔══██╗████╗  ██║██╔══██╗╚██╗ ██╔╝
███████║██║     █████╗   ╚███╔╝     ███████║██╔██╗ ██║██║  ██║    ███████║██╔██╗ ██║██║  ██║ ╚████╔╝
██╔══██║██║     ██╔══╝   ██╔██╗     ██╔══██║██║╚██╗██║██║  ██║    ██╔══██║██║╚██╗██║██║  ██║  ╚██╔╝
██║  ██║███████╗███████╗██╔╝ ██╗    ██║  ██║██║ ╚████║██████╔╝    ██║  ██║██║ ╚████║██████╔╝   ██║
╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝    ╚═╝
                    ██████╗ ██████╗ ███████╗███████╗███████╗███╗   ██╗████████╗
                    ██╔══██╗██╔══██╗██╔════╝██╔════╝██╔════╝████╗  ██║╚══██╔══╝
                    ██████╔╝██████╔╝█████╗  ███████╗█████╗  ██╔██╗ ██║   ██║
                    ██╔═══╝ ██╔══██╗██╔══╝  ╚════██║██╔══╝  ██║╚██╗██║   ██║
                    ██║     ██║  ██║███████╗███████║███████╗██║ ╚████║   ██║
                    ╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═══╝   ╚═╝
                                                                                                         "

sleep(3.0/2.0)
system "clear"


puts " █   █╗ ██╗     ██   █ ╗█ ╗  █ ╗     ██ ██╗   █╗   ██╗██   █╗      ██ █ ╗ █ █╗   ██╗██   █╗ █ ╗   █ ╗
 █╔══█ ╗ █║     █ ╔════╝╚█ ╗█ ╔      █╔══█ ╗██ █╗  █ ║██╔══██╗    ██╔══█ ╗█ █    █  ██╔══██╗╚██╗ █ ╔╝
█ █   █║ █║     ██  █╗   ╚  █╔      █ ██ █║█ ╔ █╗ ██  █║  ██║    ██   █ ║██╔█ ╗ ██  █║  ██║ ╚█  █╔╝
█ ╔══█ ║█ ║      █╔══╝    █╔█ ╗      █╔   █║█ ║╚ █╗█  ██║  ██║     █╔═  █║ █║╚█ ╗██║██║  ██║  ╚█ ╔╝
█ ║  █ ║█  █  █╗ ██   █╗█ ╔╝  █╗    █ ║   █║ █║ ╚█ █      █ ╔╝    █ ║  ██║█ ║ ╚█   ║    ██╔╝   █ ║
╚ ╝  ╚═╝╚══════╝╚══════╝╚═   ╚═     ╚ ╝  ╚═╝╚ ╝  ╚   ╝╚═  ══╝     ╚ ╝  ╚═╝╚═╝  ╚═  ╝  ══  ╝    ╚═╝
                    █   ██╗ █     ╗ ██   ██╗██   ██╗█  █  █╗█ █╗   ██╗███   ██╗
                     █╔══██╗██╔══██╗██╔════╝██╔════╝██╔════╝    ╗   █║╚══██ ══╝
                    ██   █╔╝ █ █ █╔╝█   █╗  ██   ██╗   ██╗  █ ╔██╗ █ ║   ██
                     █╔═══╝ █ ╔ ═ █╗██╔══╝  ╚════██║██╔══╝  █ ║╚██╗██║   ██
                     █║     █ ║  █ ║██   ██╗██   ██║█   ███╗█ ║ ╚   █║   ██
                    ╚ ╝     ╚ ╝  ╚═ ╚ ═ ═ ═╝╚═    ╝╚═   ══╝╚ ╝  ╚═      ╚═╝
                                                                                                         "
sleep(1.0/2.0)
system "clear"

puts "
 █ █ █╗  █ █ █╗  █ ╗   █ █   █  █ ╗     █╗   █ ╗█ ╗  █ █ █╗  █╗  █ ╗██ █ █ █╗
 █╔════╝  █╔══█ ╗█ █ ╗ █ █ ║ █ ═ ═ ╝    █  █   █  █ ║ █╔══ ═╝ █ ║  █ ║╚ ═█ ╔═ ╝
 █║  █ █╗ █ █  █║ █╔█ █ ╔█ ║ █  █       █ ╔  ╗  █  █║█ ║  ██ ╗  █ █ █     █║
 █║   █ ║ █╔══█ ║ █║╚█ ╔╝ █  █ ═ ╝       █ ╚█ ╗█ ║█ ║ █║    █║  ╔ ═ █║   █ ║
  █ █ █ ╝█ ║  █ ║█ ║ ╚═╝  █║ █ █ █     █  ╚█  █║ █ ╚ █ █ █╔╝█ ║  █ ║    █║
 ═ ═ ═  ╚ ╝  ╚ ╝╚ ╝     ╚ ╝ ═ ═ ═ ╝    ╚ ╝  ╚ ═ ╝╚ ╝  ═ ═ ═  ╚═╝  ╚═╝    ═╝

"

sleep(1.0/2.0)
system "clear"
puts "
█ █ ██╗   █ ██╗ █ █╗   █ █╗██ █  █╗    █ █╗   ██╗██╗ █ █ ██╗ ██╗  ██╗██ ██ ██╗
██╔════╝ ██╔══██╗██ █╗ ██ █║██╔════╝    ██ █╗  █ ║ █║██╔════╝ ██║  ██║╚══██╔══╝
 █║  █ █╗ █ █  █║██╔█ ██╔█ ║█ ███╗      █ ╔██╗ █ ║█ ║ █║  █ █╗█  ██ █║   █ ║
██║   ██║█ ╔══█ ║█ ║╚██╔╝█ ║██╔══╝       █║╚██╗█ ║ █║██║   ██║█ ╔══██║   ██║
╚█ █ ██╔╝██║   █║██║ ╚═╝ █ ║██ ██ █╗    ██║ ╚██ █║█ ║╚█ ██ █╔╝██║  ██║    █║
╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚═╝  ╚═══╝╚═╝ ╚══ ══╝ ╚═╝  ╚═╝   ╚═╝
"

sleep(1.0/2.0)
system "clear"
puts "
█ █ ██╗   █ ██╗ █ █╗   █ █╗██ ████╗    █ █╗   ██╗██╗ ███ ██╗ ██╗  ██╗██ ██ ██╗
██╔════╝ ██╔══██╗██ █╗ ██ █║██╔════╝    ██ █╗  ██║██║██╔════╝ ██║  ██║╚══██╔══╝
 █║  █ █╗██ ██ █║██╔█ ██╔██║█ ███╗      ██╔██╗ █ ║█ ║██║  █ █╗██ ██ █║   █ ║
██║   ██║██╔══██║█ ║╚██╔╝██║██╔══╝      ██║╚██╗██║██║██║   ██║██╔══██║   ██║
╚█ █ ██╔╝██║  ██║██║ ╚═╝ ██║██ ██ █╗    ██║ ╚██ █║██║╚█ ██ █╔╝██║  ██║    █║
╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚═╝  ╚═══╝╚═╝ ╚══ ══╝ ╚═╝  ╚═╝   ╚═╝
"
sleep(1.0/2.0)
system "clear"
puts "
██████╗  █████╗ ███╗   ███╗███████╗    ███╗   ██╗██╗ ██████╗ ██╗  ██╗████████╗
██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ████╗  ██║██║██╔════╝ ██║  ██║╚══██╔══╝
██║  ███╗███████║██╔████╔██║█████╗      ██╔██╗ ██║██║██║  ███╗███████║   ██║
██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██║╚██╗██║██║██║   ██║██╔══██║   ██║
╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ██║ ╚████║██║╚██████╔╝██║  ██║   ██║
╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝"



def welcome
  # system "clear"
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
    password_input = PROMPT.mask("Ugh #{user.name}! It's you again? Please enter your password:", mask:decor)
    if @player_one == nil
      @player_one = user if user.check_password(password_input)
    else
      @player_two = user if user.check_password(password_input)
    end
  else
    puts "Looks like it's your first time playing."
    password_input = PROMPT.mask("Please create your password, and make it good:", mask:decor)
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
  puts "❌════⭕️════❌════⭕️════❌════⭕️════❌════⭕️════❌═════⭕️"
  puts "
 o     o         o         o     o
 8b   d8                   8b   d8
 8`b d'8 .oPYo. o8 odYo.   8`b d'8 .oPYo. odYo. o    o
 8 `o' 8 .oooo8  8 8' `8   8 `o' 8 8oooo8 8' `8 8    8
 8     8 8    8  8 8   8   8     8 8.     8   8 8    8
 8     8 `YooP8  8 8   8   8     8 `Yooo' 8   8 `YooP'
 ..::::..:.....::....::..::..::::..:.....:..::..:.....:
 ::::::::::::::::::::::::::::::::::::::::::::::::::::::
 ::::::::::::::::::::::::::::::::::::::::::::::::::::::"
  puts "❌════⭕️════❌════⭕️════❌════⭕️════❌════⭕️════❌═════⭕️"

  pid = fork{exec 'afplay' , "./music/opening.mp3" }
  select_array = ["Tic Tac Toe", {name: "Connect Four", disabled: '(not available)'}, {name: "Chess", disabled: '(not available)'}, {name: "Checkers", disabled: '(not available)'}, "View #{@player_one.name}'s Profile", "View #{@player_two.name}'s Profile", "Exit"]
  game_input = PROMPT.select("I've never seen such indecision! What do you want to do?", select_array, per_page: 8)
  until game_input == "Exit"
    if game_input == "Tic Tac Toe"
      start_tic_tac_toe
    elsif game_input == "View #{@player_one.name}'s Profile"
      profile_input = ""
      until profile_input == "Return To Main Menu"
        system "clear"
        profile_input = user_rounds_details(@player_one)
      end
    elsif game_input == "View #{@player_two.name}'s Profile"
      profile_input = ""
      until profile_input == "Return To Main Menu"
        system "clear"
        profile_input = user_rounds_details(@player_two)
      end
    end
    system "clear"
    puts "❌════⭕️════❌════⭕️════❌════⭕️════❌════⭕️════❌═════⭕️"
    puts "
   o     o         o         o     o
   8b   d8                   8b   d8
   8`b d'8 .oPYo. o8 odYo.   8`b d'8 .oPYo. odYo. o    o
   8 `o' 8 .oooo8  8 8' `8   8 `o' 8 8oooo8 8' `8 8    8
   8     8 8    8  8 8   8   8     8 8.     8   8 8    8
   8     8 `YooP8  8 8   8   8     8 `Yooo' 8   8 `YooP'
   ..::::..:.....::....::..::..::::..:.....:..::..:.....:
   ::::::::::::::::::::::::::::::::::::::::::::::::::::::
   ::::::::::::::::::::::::::::::::::::::::::::::::::::::"
    puts "❌════⭕️════❌════⭕️════❌════⭕️════❌════⭕️════❌═════⭕️"

    game_input = PROMPT.select("What do you want to play?", select_array)
  end
  system "clear"
end

def past_rounds(user)
  user.rounds.last(3)
end

def user_rounds_details(user)
  puts "Wins: #{user.wins}"
  rounds = past_rounds(user)
  round_ids = rounds.map {|round| "Round: #{round.id}" }.push("Return To Main Menu")
  profile_input = PROMPT.select("Pick a game to view replay or return to Main Menu", round_ids)
  rounds.each { |round| round.replay if "Round: #{round.id}" == profile_input }
  sleep(3) unless profile_input == "Return To Main Menu"
  profile_input
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
