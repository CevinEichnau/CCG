class Game

    attr_accessor :current_user

  

  def initialize
    @player = {}
    @groups = {}
    @field = [0]
  end

  def add_player(foo, bar)
    self.current_user ||= foo
    @player[foo] = bar
  end

  def get_player(foo)
    @player[foo]
  end

  def player
    @player    
  end  

  def field1
    @field = self.current_user
      
  end  

  def field

    @field

  end  
  

  def delete_player(foo)
    if !has_player?(foo)
      raise "Kein Spieler mit der ID: #{foo}" 
    end 
    @player.delete(foo)
  end

  def has_player?(foo)
    @player.each_key do |p|
      if p == foo
        return true
      end
    end
    return false
  end 


  def end_turn
    @player.each_key do |k|
      if self.current_user.nil?
        self.current_user = k
      elsif k == self.current_user 
        self.current_user = nil
      end  
    end  
    self.current_user ||= @player.keys.first
  end

  def distribute_cards
    cards = Card.randomize
    @player.each do |id, player|
        8.times do
          result = cards.shift
          player.give_card(result) 
        end
     end 
  end  



  def picked_card(foo)
     player = self.get_player(self.current_user)
     player.cards.each do |p|
        if foo == p
          player.take_card(foo)
          self.game_rules(foo, self.current_user)
          self.take_field(foo)
        end
     end
  end

  def winner

   if self.get_player(self.current_user).cards.empty?
    puts "Gewinner ist  #{self.get_player(self.current_user).name}"
   end 
  end

  def game_rules(foo, bar)

    if foo < @field.last
      puts "Ungültiger Spielzug: #{foo} ist nicht größer als #{@field.last}"
      self.punisch_card(bar)

    end  
    
  end


  def punisch_card(foo)
    cards = Card.randomize
    @player.each_key do |player|
        1.times do
          result = cards.shift
          self.get_player(foo).give_card(result) 
        end
     end 

     



  end  

  def take_field(bar)

    @field.push(bar) 

  end  

  def self.save(game)
      config = ""
       game.player.each do |id, player|
        config << 'playername-' +  id.to_s + " = " + player.name +  "\n" # spieler addet sich selbst 
        config << 'playercards-' + id.to_s +  " = " + player.cards.join(", ") + "\n"

    end  

        config << 'gamefield = ' + game.field.to_s + "\n"
        config << 'current_user ='  + game.current_user.to_s + "\n"

   
   
    
    return config
  end


  def self.load(foo)

    foo.each do |g|

       lines =  g.split("\n")
        
       lines.each do |l|

        s = l.split("=")
        puts s

       end 
       
       

    end  

  end  
  

  def self.test
    game = Game.new  

    game.add_player(1, Player.new)
    game.add_player(2, Player.new)
    
    puts "Gieb einen Namen fuer Spieler 1 ein"
    game.get_player(1).name = "cevin"
    
    

    puts "Gieb einen Namen fuer Spieler 2 ein"
    game.get_player(2).name = "alex"
    
    

    puts "Folgende Spieler sind im Spiel"
    puts game.get_player(1).name
    puts game.get_player(2).name


    puts "Mische Karten und teile sie aus"
    game.distribute_cards
    
      
    
    
      puts "#{game.get_player(game.current_user).name} du bist dran"
      puts "lege eine Karte:#{game.get_player(game.current_user).cards.join(", ")}"
      pick_card = "2"
      
      game.picked_card(pick_card.to_i)
      puts "du hast #{pick_card} abgelegt deine restlichen karten sind:#{game.get_player(game.current_user).cards.join(", ")}"


       puts "#{game.get_player(game.current_user).name} wenn du dein zug beenden willst enter (q) "
      quit = "q"
      
      if quit == "q"
        game.end_turn
      end 

      
      puts "game saved"

    puts Game.save(game)
    new_game = Game.load(Game.save(game))
  end


  def self.run_local
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
    
      
    while !game.winner

      puts "#{game.get_player(game.current_user).name} du bist dran"
      puts "lege eine Karte:#{game.get_player(game.current_user).cards.join(", ")}"
      pick_card = gets.chomp
      game.picked_card(pick_card.to_i)
      puts "du hast #{pick_card} abgelegt deine restlichen karten sind:#{game.get_player(game.current_user).cards.join(", ")}"
      



      puts "#{game.get_player(game.current_user).name} wenn du dein zug beenden willst enter (q) "
      quit = gets.chomp
      
      if quit == "q"
        game.end_turn
      end 

    end





  puts "Play again ? (y/n)"
      a = gets.chomp

      if a == "y"
         game_run2

      else

        cmd = "irb exit"

      end  



  end
end

