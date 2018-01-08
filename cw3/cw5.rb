#!/usr/bin/env ruby

count_words = {}

while line = gets
  words = line.scan(/\w+/)
  words.each { |word| (count_words[word]) ? count_words[word] += 1 : count_words[word] = 1 }
  <<-ABC
  words.each do |word|
    if count_words[word]
      count_words[word] += 1
    else
      count_words[word] = 1
    end
  end
  ABC
end

count_words.each do |key, value|
  puts "%s %d" % [key, value]
end
