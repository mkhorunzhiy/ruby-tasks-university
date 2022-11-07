def get_word_counter(str)
  count_of_words = Hash.new
  words_array = str.downcase.scan(/[a-z']+/)
  words_array.each do |word|
    if count_of_words.key? word
      count_of_words[word] += 1
    else count_of_words[word] = 1
    end
  end

  count_of_words.sort_by {|word, count| count}.reverse
end

print "Write your string: "
input_str = STDIN.gets.gsub("\n", ' ').squeeze(' ')
result = get_word_counter(input_str)
top = 1

if result.empty?
  puts "\nThere aren`t any words in your string."
else
  puts "\nTop of words: "
  result[0..2].each do |word, count|
    print "Top #{top}: "
    puts "[#{word}] -> #{count} times"
    top+= 1
  end
end