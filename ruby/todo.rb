# Basic
require 'colorize'

@items = []
@cont = true
@options = ['Show All', 'Show Complete', 'Show Active', 'Add Item', 'Mark As Complete', 'Delete Item', 'Exit']

def menu
  puts "====== TODO Ruby =====".colorize(:cyan)
  @options.each_with_index { |item, index| puts "#{index + 1}) #{item}" }
  puts "======================".colorize(:cyan)
end

while @cont
  menu
end
