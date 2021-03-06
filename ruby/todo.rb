# Basic
require 'colorize'

@items = []
@cont = true
@options = ['Show All', 'Show Complete', 'Show Active', 'Add Item', 'Mark As Complete', 'Delete Item', 'Quit']
@id = 0

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

def show_all(view = 'all')
  items = []
  case view
  when 'complete'
    items = @items.select { |i| i[:complete] }
  when 'active'
    items = @items.select { |i| !i[:complete] }
  else
    items = @items.clone
  end

  length = items.length
  plural = items.length > 1
  space
  puts "There #{plural ? 'are' : 'is'} #{length} item#{plural ? 's' : ''} on your list"
  puts "========================================="
  puts "id\t\tname\t\tstatus"
  puts "_________________________________________"
  items.each { |item| puts "#{item[:id]}\t\t#{item[:name]}\t#{item[:complete]}" }

  space
end

def find_item(id)
  data = {}
  item = @items.find { |i| i[:id] == id }
  index = @items.find_index { |i| i[:id] == id }
  data[:item] = item
  data[:index] = index
  data
end

def show_complete
  puts 'Completed'
  space
  show_all('complete')
end

def show_active
  puts 'Active'
  space
  show_all('active')
end

def add_item
  space
  puts "Item Name:\n"
  name = gets.strip
  @items << { name: name, id: @id += 1, complete: false }
  space
end

def mark_as_complete
  show_active
  puts "Which item would you like to mark complete? (id)"
  id = gets.to_i
  data = find_item(id)
  if item = data[:item]
    item[:complete] = true
  else
    puts "Invalid id"
    show_active
  end
end

def delete_item
  if @items.length > 0
    show_all 
    puts "Which item would you like to delete? (id)"
    choice = gets.to_i
    item = find_item(choice)
    if index = item[:index]
      @items.delete_at index
    else
      puts "Invalid id"
      delete_item
    end
  else
    puts "No items to delete"
  end
end

def quit
  puts 'Goodbye'
  @cont = false
end

def space
  puts "\n\n"
end

while @cont
  menu
end
