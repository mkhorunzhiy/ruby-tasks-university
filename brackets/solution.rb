def is_brackets_string_correct(string, brackets_key_value_template)
  if string.length % 2 != 0
    return false
  end

  closed_brackets = []
  string.chars do |char|
    if (closed_to_open_bracket = brackets_key_value_template[char])
      closed_brackets << closed_to_open_bracket
    elsif closed_brackets.pop != char
      return false
    end
  end

  closed_brackets.length === 0
end

brackets_key_value_template = { '(' => ')', '[' => ']', '{' => '}' }
all_brackets_string = brackets_key_value_template.keys + brackets_key_value_template.values
input_string = ''

while true do
  puts 'Enter a bracket: '
  letter = STDIN.gets.chomp.encode('UTF-8')[0]

  unless all_brackets_string.include? letter
    next
  end

  input_string += letter
  puts 'Current string: ' + input_string

  print 'String`s correctness is '
  puts is_brackets_string_correct(input_string, brackets_key_value_template)
  puts ''
end