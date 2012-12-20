class Game

    attr_accessor :current_user

  

  def initialize
    @player = {}
    @groups = {}
  end

  def add_player(foo, bar)
    self.current_user ||= foo
    @player[foo] = bar
  end

  def get_player(foo)
    @player[foo]
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
     self.get_player(self.current_user).cards.each do |p|
      if foo == p

        take_card(foo)

      
        
      end
     end
  end  


end