WORDS = %w(agreement ahead air syntax allow challenge ternary character environmental especially eye template face fact goal good government measure media peace people)
def get_rand_word
  WORDS.sample
end

hangman_word = get_rand_word

guessing_word = ''
hangman_word.split('').each do
  guessing_word += '_'
end

healthpoints = 7
num_of_guessed_letters = 0

while healthpoints > 0
  puts ''
  print 'Hangman word: '
  puts guessing_word

  print 'Healthpoints: '
  puts healthpoints

  print 'Write your letter: '
  letter = STDIN.gets.chomp.encode('UTF-8')[0]

  print 'Your letter: '
  puts letter

  is_guessed_letter = false

  hangman_word.split('').each_with_index do |letter_h, index|
    if letter === letter_h
      is_guessed_letter = true
      num_of_guessed_letters += 1
      guessing_word[index] = letter_h
    end
  end

  if num_of_guessed_letters === hangman_word.length 
    print 'Win! The word is '+ hangman_word+ ' .'
    break
  elsif !is_guessed_letter
    healthpoints -= 1

    if healthpoints < 0 
       puts 'GAME OVER'
    end
  end
end