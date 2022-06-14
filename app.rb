require_relative 'game'
require_relative 'genre'
require 'json'

class App
  def initialize
    @games = []
    load_saved_games
  end

  def load_saved_games
    return unless File.exist?('games.json')

    JSON.parse(File.read('games.json')).each do |game|
      @games << Game.new(game[0], game[1], game[2], game[3])
      if game[4]
        genre = Genre.new(game[4])
        genre.add_item(@games.last)
      end
    end
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
      genre_array << game.genre.name if game.genre
    end

    puts
    genre_array.uniq.each do |genre|
      puts genre
    end
    puts
  end

  def add_game
    print 'Enter the title of the game: '
    title = gets.chomp

    print 'Enter the date the game was published (yyyy-mm-dd): '
    publish_date = ask_for_date

    print 'Enter the date the game was last played (yyyy-mm-dd): '
    last_played_at_date = ask_for_date

    multiplayer = false
    print 'Is the game multiplayer? (y/n): '
    multiplayer = true if gets.chomp.downcase == 'y'

    @games << Game.new(title, publish_date, multiplayer, last_played_at_date)
    save_games
  end

  def ask_for_date
    Date.strptime(gets.chomp, '%Y-%m-%d')
  rescue ArgumentError
    print 'Invalid date, please try again:'
    retry
  end

  def save_games
    save_games_array = []
    @games.each do |game|
      save_game = [game.title, game.publish_date, game.multiplayer, game.last_played_at_date]
      save_game << game.genre.name if game.genre
      save_games_array << save_game
    end
    File.write('games.json', save_games_array.to_json)
  end
end
