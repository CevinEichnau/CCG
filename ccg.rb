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