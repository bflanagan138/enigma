require_relative 'enigma'

module Shift

  def key_to_four_pairs
    final_keys = []
    split_keys = key.split("")
    4.times do |i|
      final_keys << (split_keys[i] + split_keys[i + 1]).to_i
    end
    final_keys
  end

  def convert_offset
    ((date.to_i ** 2) % 10000).to_s.chars.map(&:to_i)
  end

  def shift_number(number, shift_number)
    (number + shift_number) %27
  end

  def unshift_number(number, shift_number)
    (number - shift_number) %27
  end

  def final_shift
    [key_to_four_pairs, convert_offset].transpose.map(&:sum)
  end
end