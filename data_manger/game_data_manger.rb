require_relative '../lib/game'
require_relative '../lib/author'
require 'json'
require 'date'

module GameDataManger
  def create_game
    print 'Enter publish date (YYYY-MM-DD): '
    publish_date = gets.chomp

    print 'Is the game multiplayer? (yes/no): '
    multiplayer_input = gets.chomp.downcase
    multiplayer = multiplayer_input == 'yes'

    print 'Enter the last played date (YYYY-MM-DD):'
    date_input = gets.chomp

    begin
      last_played_at = Date.parse(date_input).to_time
    rescue ArgumentError
      puts 'Invalid date format. Please use YYYY-MM-DD.'
      create_game
    end

    game = Game.new(publish_date, multiplayer, last_played_at)
    @games << game

    create_author
  end

  def create_author
    puts 'Author First and last name:'
    print 'FirstName: '
    author_first_name = gets.chomp
    print('LastName: ')
    author_last_name = gets.chomp
    author = Author.new(author_first_name, author_last_name)
    @authors << author
    puts 'Game added successfully with author'
  end

  def self.load_games
    if File.exist?('./data/games.json')
      games = JSON.parse(File.read('./data/games.json')).map do |game|
        Game.new(game['publish_date'], game['multiplayer'], game['last_played_at'], archived:game['archived'])
      end
    else
      File.write('./data/games.json', JSON.dump([]))
    end
    games.any? ? games : []
  end

  def self.save_game(games)
    if games.any?
      File.write('./data/games.json', JSON.dump(games))
    else
      File.write('./data/games.json', JSON.dump([]))
    end
  end
end
