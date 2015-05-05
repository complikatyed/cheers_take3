require_relative '../test_helper'
require_relative '../../lib/cheer'

class TestCheer < Minitest::Test

  def test_happy_path_name
    actual = Cheer.for_person("Ed")
    expected = "Give me an.. E!\n" +
               "Give me a... D!\n" +
               "Ed's just GRAND!"
    assert_equal expected, actual
  end

  def test_name_with_spaces
    actual = Cheer.for_person("Ed Bob")
    expected = "Give me an.. E!\n" +
               "Give me a... D!\n" +
               "Give me a... B!\n" +
               "Give me an.. O!\n" +
               "Give me a... B!\n" +
               "Ed's just GRAND!"
    assert_equal expected, actual
  end

  def test_name_with_hyphen
    actual = Cheer.for_person("Ed-Bob")
    expected = "Give me an.. E!\n" +
               "Give me a... D!\n" +
               "Give me a... B!\n" +
               "Give me an.. O!\n" +
               "Give me a... B!\n" +
               "Ed's just GRAND!"
    assert_equal expected, actual
  end

  def test_empty_string_
  actual = Cheer.for_person("  ")
  expected = "I'd cheer for you if only I knew who you are."
  assert_equal expected, output
  end

  def test_name_that_has_no_word_characters
    actual = Cheer.for_person("1^892@")
    expected = "I'm sorry.  I didn't understand what you typed."
    assert_equal expected, actual
  end



end
