require_relative 'enigma'

module Shift

  def key_to_four_pairs
    final_keys = []
    split_keys = key.split("")
    4.times do |i|
      final_keys << (split_keys[i] + split_keys[i + 1]).to_i + convert_offset[i]
    end
    final_keys
  end

  def convert_offset
    # require 'pry'; binding.pry
    ((date.to_i ** 2) % 10000).digits.reverse
  end

  def shift_number(number, shift_number)
    (number + shift_number) %27
  end

  def unshift_number(number, shift_number)
    (number - shift_number) %27
  end

  # def final_shift
  #   [key_to_four_pairs, convert_offset].transpose.map(&:sum)
  # end
end