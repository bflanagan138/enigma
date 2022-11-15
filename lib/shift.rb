require_relative 'enigma'

class Shift

  attr_reader :character_set,
              :key,
              :offset
  def initialize(key, offset)
    @character_set = ("a".."z").to_a << " "
    @key = key
    @offset = offset
  end

  def key_to_four_pairs
    require 'pry'; binding.pry
    final_keys = []
    split_keys = key.split("")
    4.times do |i|
      final_keys << (split_keys[i] + split_keys[i + 1]).to_i
    end
    final_keys
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