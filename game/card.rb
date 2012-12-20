class Card

  NAMES={
            1 => "A <3",
            2 => "A +",
            3 => "A ^",
            4 => "A #",
            5 => "K <3",
            6 => "K +",
            7 => "K ^",
            8 => "K #",
            9 => "D <3",
            10 => "D +",
            11 => "D ^",
            12 => "D #",
            13 => "B <3",
            14 => "B +",
            15 => "B ^",
            16 => "B #",
            17 => "10 <3",
            18 => "10 +",
            19 => "10 ^",
            20 => "10 #",
            21 => "9 <3",
            22 => "9 +",
            23 => "9 ^",
            24 => "9 #",
            25 => "8 <3",
            26 => "8 +",
            27 => "8 ^",
            28 => "8 #",
            29 => "7 <3",
            30 => "7 +",
            31 => "7 ^",
            32 => "7 #"
    }

  def self.get_name(card)
    return NAMES[card]
  end  

  def self.valid_cards
    NAMES.keys
  end

  def self.randomize
    NAMES.keys.shuffle
  end

end