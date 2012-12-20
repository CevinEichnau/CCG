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
  
  puts "Gieb einen Namen für Spieler 1 ein"
  game.get_player(1).name = gets.chomp

  puts "Gieb einen Namen für Spieler 2 ein"
  game.get_player(2).name = gets.chomp


  puts "Folgende Spieler sind im Spiel"
  puts game.get_player(1).name
  puts game.get_player(2).name
end

def run_game
  puts "Gieb ein Namen für dein Spieler Ein"
  player_name = gets.chomp

  puts "Dein Spieler heißt: " + player_name


  puts "Spieler speichern ? (y/n)"
  answer = gets.chomp
  if answer == "y"

    spieler = Player.new
  
    
    spieler.name = player_name

    puts "Dein gespeicherter Spieler heißt:" + spieler.name

  else

    puts "By"

  end 




end
