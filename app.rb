require_relative 'data_manger/game_data_manger'
require_relative 'data_manger/author_data_manger'

class App
  include GameDataManger
  def initialize
    @games = GameDataManger.load_games
    @authors = AuthorDataManger.load_authors
  end

  def save_data
    GameDataManger.save_game(@games)
    AuthorDataManger.save_author(@authors)
  end

  def list_games
    puts 'List of Games:'
    @games.each { |game| puts "Multiplayer: #{game.multiplayer}, Last played at: #{game.last_played_at}" }
  end

  def list_authors
    puts 'List of Authors:'
    @authors.each_with_index do |author, i|
      puts "#{i + 1} - Author name: #{author.first_name} #{author.last_name}" if author
    end
  end

  def display_menu
    puts ' '
    puts '*' * 50
    puts "|\t\tWelcome to our App!\t\t|"
    puts '*' * 50
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all music album'
    puts '3 - List all games'
    puts '4 - List all genres'
    puts '5 - List all labels'
    puts '6 - List all authors'
    puts '7 - Add a book'
    puts '8 - Add a music album'
    puts '9 - Add a game'
    puts '10 - Exit'
  end

  def process_option
    option = gets.chomp.to_i
    options = {
      1 => -> { 'list_all_books' },
      2 => -> { 'list_all_music_albums' },
      3 => -> { list_games },
      4 => -> { 'list_all_genres' },
      5 => -> { 'list_all_labels' },
      6 => -> { list_authors },
      7 => -> { 'add_book' },
      8 => -> { 'add_music_album' },
      9 => -> { create_game },
      10 => lambda {
        save_data
        exit
      }
    }
    case option
    when 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
      options[option].call
    end
  end
end
