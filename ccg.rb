# irb
# load "ccg.rb"

require "./game/card.rb"
require "./game/player.rb"
require "./game/game.rb"

def reload!
  load "./game/card.rb"
  load "./game/player.rb"
  load "./game/game.rb"
end


def run_game2
  game = Game.new  
  game.add_player(1, Player.new)
  game.add_player(2, Player.new)
  
  puts "Gieb einen Namen fuer Spieler 1 ein"
  game.get_player(1).name = gets.chomp
  

  puts "Gieb einen Namen fuer Spieler 2 ein"
  game.get_player(2).name = gets.chomp
  

  puts "Folgende Spieler sind im Spiel"
  puts game.get_player(1).name
  puts game.get_player(2).name


  puts "Mische Karten und teile sie aus"
  game.distribute_cards
  
    
    puts "#{game.get_player(game.current_user).name} du bist dran"
    puts "lege eine Karte:#{game.get_player(game.current_user).cards}"
    pick_card = gets.chomp
    game.picked_card(pick_card)
    puts "du hast #{pick_card} abgelegt deine restlichen karten sind:#{game.get_player(game.current_user).cards}"
    



    puts "#{game.get_player(game.current_user).name} wenn du dein zug beenden willst enter (q) "
    quit = gets.chomp
    
    if quit == "q"
      game.end_turn
    end 

  
end

def run_game
  puts "Gieb ein Namen fuer dein Spieler Ein"
  player_name = gets.chomp

  puts "Dein Spieler heisst: " + player_name


  puts "Spieler speichern ? (y/n)"
  answer = gets.chomp
  if answer == "y"

    spieler = Player.new
  
    
    spieler.name = player_name

    puts "Dein gespeicherter Spieler heisst:" + spieler.name

  else

    puts "By"

  end 




end
