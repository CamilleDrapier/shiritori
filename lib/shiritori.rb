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

  def self.valid_word?(japanese_nouns_as_katakana, used_words, word)
    japanese_nouns_as_katakana.include?(word) &&
    !used_words.include?(word) &&
    (used_words.empty? || used_words.last&.[](-1) == word[0]) &&
     word[-1] != "ん"
  end
end
