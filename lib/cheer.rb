require_relative "./birthday_parser.rb"
require 'date'

class Cheer

  def self.valid_name?(name)
    adjusted_name = name.upcase.gsub(/[^A-Z]*/, '')
    !adjusted_name.empty?
  end

  def self.for_person(name)
    original_name = name.chomp

    raise ArgumentError unless valid_name?(name)
    output = ""
    adjusted_name = name.upcase.gsub(/[^A-Z]*/, '')
    adjusted_name.each_char do |char|

      if "AEFHILMNORSX".include? char
        article = "an"
      else
        article = "a."
      end
      output << "Give me #{article}.. #{char}!\n"
    end
      output << "#{original_name}'s just GRAND!"
  end

  def self.for_birthday(birthday)
    today = Date.today
    next_birthday = BirthdayParser.parse(birthday)
    difference = next_birthday - today
    days_left = (difference % 365).numerator
    case days_left
    when 0
      "Happy Birthday!"
    when 1
      "Awesome! Your birthday is in 1 day! Happy Birthday in advance!"
    else
      "Awesome! Your birthday is in #{days_left} days!  Happy Birthday in advance!"
    end
  end

end
