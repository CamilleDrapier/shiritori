require "nkf"

class Shiritori
  def self.to_katakana(string)
    NKF.nkf("-w -h2", string)
  end

  def self.japanese_nouns
    @japanese_nouns ||= begin
      word_data_file = File.expand_path('../data/word_data.txt', __dir__)
      File.readlines(word_data_file).map {|string| string.chomp! }
    end
  end

  def self.valid_word?(valid_words, used_words, word)
    valid_words.include?(word) &&
    !used_words.include?(word) &&
    (used_words.empty? || used_words.last&.[](-1) == word[0]) &&
     word[-1] != "ん"
  end

  def self.valid_word?(valid_words, used_words, word)
    in_dictionnary?(word) &&
    unused?(word) &&
    chaining?(word) &&
    !terminal?(word)
    (used_words.empty? || used_words.last&.[](-1) == word[0]) &&
     word[-1] != "ん"
  end
end
