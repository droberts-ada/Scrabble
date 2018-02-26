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
      return nil if array_of_words.length == 0

      # Loop through all the words
      #   if the current word is better than the best we've seen
      #     best word = current word
      #   end
      # end
      best_word = array_of_words.first
      array_of_words.each do |word|
        if score(word) > score(best_word)
          best_word = word
        elsif score(word) == score(best_word)
          best_word = break_tie(best_word, word)
        end
      end

      return best_word
    end

    def self.break_tie(incumbent, challenger)
      if incumbent.length == 7
        return incumbent

      elsif challenger.length == 7
        return challenger

      elsif challenger.length < incumbent.length
        return challenger

      else
        return incumbent
      end
    end
  end
end
