alex = User.create(name: "Alex", password: "password")
andy = User.create(name: "Andy", password: "password")

game1 = Game.create(name: "Tic Tac Toe")

round1 = Round.create(game_id: game1.id, player_one_id: alex.id, player_two_id: andy.id)
round2 = Round.create(game_id: game1.id, player_one_id: andy.id, player_two_id: alex.id, winner_id: alex.id, status: "complete")
