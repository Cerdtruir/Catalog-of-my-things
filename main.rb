
def main
  loop do
    menu_selection
  end
end

def menu_selection
  puts '1 - List all games'
  puts '2 - List all genres'
  puts '3 - Add a game'
  puts '4 - Exit'
  print 'Please select one of the above options: '
  option = gets.chomp.to_i
  case option
  when 1
  when 2
  when 3
  when 4
    exit
  else
    puts 'Invalid option'
  end
end

main
