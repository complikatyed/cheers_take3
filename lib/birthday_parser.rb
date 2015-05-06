require 'date'

class BirthdayParser


  def self.valid_birthday?(birthday)
    integer_birthday = birthday.gsub(/\D/,'')
    month = integer_birthday[0..1]
    day = integer_birthday[3..4]

    !integer_birthday.empty?
    integer_birthday.length? == 4

    (1..12).include? month
    (1..31).include? day
  end


  def self.parse(birthday)
    Date.parse("2015/#{birthday}")
  end

end
