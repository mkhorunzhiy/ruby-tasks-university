def is_numeric?(obj) 
  obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
end

def is_operator?(obj) 
  obj.to_s.match(/-|\+|\*|\//) == nil ? false : true
end

puts 'Enter the first number:'
first_num = 'startNum'
while !is_numeric?(first_num)
  first_num = gets.chomp

  if !is_numeric?(first_num)
    puts 'Enter the number only: '
  end
end
first_num = first_num.to_i

puts 'ENTER OPERATOR (+ - * /):'
operator = 'startOperator'
while !is_operator?(operator)
  operator = gets.chomp

  if !is_operator?(operator)
    puts 'Enter the operator only: '
  end
end

puts 'Enter the second number:'
second_num = 'startNum'
while !is_numeric?(second_num)
  second_num = gets.chomp

  if !is_numeric?(second_num)
    puts 'Enter the number only: '
  end
end
second_num = second_num.to_i

print 'Result: '

case operator
  when '+'
    puts first_num + second_num
  when '-'
    puts first_num - second_num
  when '*'
    puts first_num * second_num
  when '/'
    begin
      puts first_num / second_num
    rescue ZeroDivisionError => error
      puts error.message
    end
end