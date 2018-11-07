require "minitest/autorun"

$:.unshift File.expand_path("../lib", __dir__)
require "shiritori"

class ShiritoriTest < Minitest::Test
  def test_to_katakana
    assert_equal("カタカナ", Shiritori.to_katakana('かたかな'))
  end

  def valid_words
    ['aa', 'ab', 'ac', 'bc', 'bd', 'bあん']
  end
  def used_words
    ['ab']
  end

  def test_unknown_word
    assert_equal(false, Shiritori.valid_word?(valid_words, used_words, 'cc'))
  end

  def test_not_chainable_word
    assert_equal(false, Shiritori.valid_word?(valid_words, used_words, 'ac'))
  end

  def test_used_word
    assert_equal(false, Shiritori.valid_word?(valid_words, used_words, 'ab'))
  end

  def test_valid_word_1
    assert_equal(true, Shiritori.valid_word?(valid_words, used_words, 'bc'))
  end

  def test_valid_word_2
    assert_equal(true, Shiritori.valid_word?(valid_words, used_words, 'bd'))
  end

  def test_valid_first_word
    assert_equal(true, Shiritori.valid_word?(valid_words, [], 'bd'))
  end

  def test_valid_first_word
    assert_equal(false, Shiritori.valid_word?(valid_words, [], 'bあん'))
  end
end
