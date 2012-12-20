class Player
	
	def initialize
		@players_name = ""
		@cards = []
	end

	def name
		@players_name
	end  

	def name=(foo)
		@players_name = foo
	end  

	def cards
		@cards
	end  

	def cards=(foo)
		@cards = foo
	end 

	def game_cards
		@cards 
	end  

	def give_card(card)
		if has_card?(card)
			raise "Spieler hat Karte schon #{card}"
		end	
		@cards.push(card) 

	end

	def take_card(card)
		if !has_card?(card)
			raise "Spieler hat Karte nicht: #{card}" 
		end	
		@cards.delete(card)
	end

	#def set_cards(cards_array)
	#	@cards = cards_array
	#end	

	def has_card?(card)
  	@cards.each do |c|
  		if c == card
  			return true
  		end
  	end
  	return false
	end	


end

