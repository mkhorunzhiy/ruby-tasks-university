input_string = 'The sunset sets at twelve o\' clock.'
puts input_string

def alphabet_position(string)
  first_codepoint  = 'a'.ord
  last_codepoint  = 'z'.ord

  "#{string
      .downcase
      .split('')
      .map { |letter| letter.ord }
      .select { |letter_codepoint| letter_codepoint >= first_codepoint && letter_codepoint <= last_codepoint }
      .map { |letter_codepoint| letter_codepoint - first_codepoint + 1 }
  }".gsub(",", "")
end

puts alphabet_position(input_string)

print 'Write your string to test: '
user_string = gets.chop()

puts user_string
puts alphabet_position(user_string)
