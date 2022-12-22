def opz(iStr, stack)
  priority = Hash["(" => 0, "+" => 1, "-" => 1, "*" => 2, "/" => 2, "^" => 3]
  case iStr
  when /^\s*([^\+\-\*\/\(\)\^\s]+)\s*(.*)/ then $1 + " " + opz($2, stack)
  when /^\s*([\+\-\*\/\^])\s*(.*)/
    if (stack.empty? or priority[stack.last] < priority[$1]) then
      opz($2, stack.push($1))
    else
      stack.pop + " " + opz(iStr, stack)
    end
  when /^\s*\(\s*(.*)/ then opz($1, stack.push("("))
  when /^\s*\)\s*(.*)/
    if stack.empty? then
      raise "Error: Excess of closing brackets."
    elsif priority[head = stack.pop] > 0 then
      head + " " + opz(iStr, stack)
    else
      opz($1, stack)
    end
  else
    if stack.empty? then
      ""
    elsif priority[stack.last] > 0 then
      stack.pop + " " + opz(iStr, stack)
    else
      raise "Error: Excess of opening brackets."
    end
  end
end

OPERATIONS = {
  "+" => lambda { |a, b| a + b },
  "-" => lambda { |a, b| a - b },
  "*" => lambda { |a, b| a * b },
  "/" => lambda { |a, b| a / b }
}

def eval_polish(expression)
  elements = expression.split
  stack = []
  elements.each { |element|
    if OPERATIONS.keys.include? element
      b = stack.pop
      a = stack.pop
      stack.push OPERATIONS[element].call a, b
    else
      stack.push element.to_i
    end
  }
  stack.pop
end

puts "Введіть вираз: "
a = gets
polnot = opz(a, [])
puts "Запис у зворотній польскій нотації: " + polnot.to_s
puts "Результат обчислень: " + eval_polish(polnot).to_s