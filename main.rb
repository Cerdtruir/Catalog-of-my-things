require_relative 'app'

def main
  @app = App.new
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
    @app.list_all_games
  when 2
    @app.list_all_genres
  when 3
    @app.add_game
  when 4
    exit
  else
    puts 'Invalid option'
  end
end

main
