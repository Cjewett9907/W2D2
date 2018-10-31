require 'colorize'
# require 'colorized_string'

# puts "This is blue".colorize(:blue)
str = "Nero"
arr = String.colors
arr.each do |color|
  puts str.colorize(color) + " with #{color}"
end
