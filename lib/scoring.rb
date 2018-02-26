module Scrabble
  class Scoring
    LETTER_VALUES = {
      'a' => 1,
      'b' => 3,
      'c' => 3,
      'd' => 2,
      'e' => 1,
      'f' => 4,
      'g' => 2,
      'h' => 4,
      'i' => 1,
      'j' => 8,
      'k' => 5,
      'l' => 1,
      'm' => 3,
      'n' => 1,
      'o' => 1,
      'p' => 3,
      'q' => 10,
      'r' => 1,
      's' => 1,
      't' => 1,
      'u' => 1,
      'v' => 4,
      'w' => 4,
      'x' => 8,
      'y' => 4,
      'z' => 10
    }
    def self.score(word)
      return nil if word.length > 7 || word.length == 0

      score = 0
      word.downcase.each_char do |letter|
        return nil unless LETTER_VALUES.include?(letter)
        score += LETTER_VALUES[letter]
      end

      score += 50 if word.length == 7
      return score
    end

    def self.highest_score_from(array_of_words)
    end
  end
end
