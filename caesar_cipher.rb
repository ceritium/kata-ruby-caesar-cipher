class CaesarCipher

  attr_accessor :offset
  
  ALPHABET = %w{a b c d e f g h i j k l m n o p q r s t u v w x y z}
  ENCODE = 1
  DECODE = -1
  
  def initialize(offset = 1)
    @offset = offset
  end
  
  def encode(string)
    cypher(ENCODE, string)
  end
  
  def decode(string)
    cypher(DECODE, string)
  end
  
  def cypher(direction, string)
    output = ""
    string.downcase.chars.each do |c|
      index = ALPHABET.index(c)
      output << (index.nil? ? c : ALPHABET.at((index + direction * offset) % ALPHABET.count))
    end
    output
  end
  
end