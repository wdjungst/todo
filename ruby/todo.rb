# Basic
require 'colorize'

@items = []
@cont = true
@options = ['Show All', 'Show Complete', 'Show Active', 'Add Item', 'Mark As Complete', 'Delete Item', 'Quit']

def menu
  puts "====== TODO Ruby =====".colorize(:cyan)
  @options.each_with_index { |item, index| puts "#{index + 1}) #{item}" }
  puts "======================".colorize(:cyan)
  user_choice
end

def user_choice
  puts "Please make a selection: (1 - #{@options.length})\n"
  choice = gets.to_i
  if choice > 0 && choice <= @options.length
    selection = @options[choice - 1].gsub(" ", "_").downcase.to_sym
    send selection
  else
    puts "Invalid choice".colorize(:red)
    user_choice
  end
end

def show_all
  puts 'show all'
end

def show_complete
  puts 'show complete'
end

def show_active
  puts 'show active'
end

def add_item
  puts 'add item'
end

def mark_as_complete
  puts 'mark as complete'
end

def delete_item
  puts 'delete item'
end

def quit
  puts 'quit'
  @cont = false
end

while @cont
  menu
end
