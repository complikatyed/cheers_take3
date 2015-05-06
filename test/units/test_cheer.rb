require_relative '../test_helper'
require_relative '../../lib/cheer.rb'
require_relative '../../lib/birthday_parser.rb'

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
               "Ed Bob's just GRAND!"
    assert_equal expected, actual
  end

  def test_name_with_hyphen
    actual = Cheer.for_person("Ed-Bob")
    expected = "Give me an.. E!\n" +
               "Give me a... D!\n" +
               "Give me a... B!\n" +
               "Give me an.. O!\n" +
               "Give me a... B!\n" +
               "Ed-Bob's just GRAND!"
    assert_equal expected, actual
  end

  def test_empty_string_
    assert_raise(ArgumentError) do
      Cheer.for_person("  ")
    end
  end

  def test_name_that_has_no_word_characters
    assert_raise(ArgumentError) do
      Cheer.for_person("39_>2")
    end
  end

  def test_birthday_today
    actual = Cheer.for_birthday("05/05")
    expected = "Awesome!  Your birthday is today!  Happy Birthday!"
    assert_equal actual, expected
  end

  def test_birthday_tomorrow
    fail
    actual = Cheer.for_birthday("05/06")
    expected ="Awesome! Your birthday is in 1 day!  Happy Birthday in advance!"
    assert_equal actual, expected
  end

  def test_birthday_yesterday
    actual = Cheer.for_birthday("05/04")
    expected = "Awesome! Your birthday is in 364 days!  Happy Birthday in advance!"
  end

  def test_birthday_in_near_future
    actual = Cheer.for_birthday("06/02")
    expected = "Awesome!  Your birthday is in 28 days!  Happy Birthday in advance!"
  end

end
