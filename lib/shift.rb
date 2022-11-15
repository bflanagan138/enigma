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
    ((date.to_i ** 2) % 10000).digits.reverse
  end

  def shift_number(encrypted_character, shift)
    (encrypted_character + shift) %27
    # require 'pry'; binding.pry
  end

  def unshift_number(encryption_number, shift)
    (encryption_number - shift) %27
  end
end