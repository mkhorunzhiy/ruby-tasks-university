options = %w(rock scissors paper)
user_choice = 'startChoise'
while user_choice != 3
  comp_choice = rand(0..2)
  puts 'Computer choise: ' + options[comp_choice]
  puts 'Choose an option rock(0), scissors(1), paper(2), to end a game(3): '
  user_choice = gets.to_i
  case user_choice
  when 0..2
    print 'And winer is...'
    if user_choice === comp_choice 
      puts 'no one. It is a draw!'
    elsif (user_choice === 0 && comp_choice === 1) || (user_choice === 1 && comp_choice === 2) || (user_choice === 2 && comp_choice === 0)
      puts 'you. Congratulations!'
    else puts 'computer ;( You lose.'
    end
  when 3
    puts 'It was a nice game :^)'
  else
    puts 'Choose a correct num please.'
  end
end