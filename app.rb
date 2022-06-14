require_relative 'game'

class App
  def initialize
    @games = []
  end

  def list_all_games
    puts
    @games.each do |game|
      print "Title: #{game.title}"
      print ", Published on: #{game.publish_date}"
      print ", Last played on: #{game.last_played_at_date}"
      print ", Multiplayer: #{game.multiplayer} \n"
    end
    puts
  end

  def list_all_genres
    genre_array = []
    @games.each do |game|
      genre_array << game.genre.name unless genre_array.include?(game.genre.name)
    end

    puts
    genre_array.each do |genre|
      puts genre
    end
    puts
  end

  def add_game
    print 'Enter the title of the game: '
    title = gets.chomp

    begin
      print 'Enter the date the game was published (yyyy-mm-dd): '
      publish_date = Date.strptime(gets.chomp, '%Y-%m-%d')
    rescue ArgumentError
      puts 'Invalid input'
      retry
    end

    begin
      print 'When was the game last played? (yyyy-mm-dd): '
      last_played_at_date = Date.strptime(gets.chomp, '%Y-%m-%d')
    rescue ArgumentError
      puts 'Invalid input'
      retry
    end

    multiplayer = false
    print 'Is the game multiplayer? (y/n): '
    multiplayer = true if gets.chomp.downcase == 'y'

    @games << Game.new(title, publish_date, multiplayer, last_played_at_date)
  end
end
