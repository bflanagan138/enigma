require_relative 'enigma'

class Shift

  attr_reader :character_set
  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def shift_number(number, shift_number)
    (number + shift_number) %27
  end

  def unshift_number(number, shift_number)
    (number - shift_number) %27
  end

  def final_shift
    if date != nil
      [key_to_four_pairs, date].transpose.map(&:sum)
    else 
      [key_to_four_pairs, convert_offset(todays_date)].transpose.map(&:sum)
    end
  end

end