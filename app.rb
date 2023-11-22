# app.rb
require_relative 'data_manger/game_data_manger'
require_relative 'data_manger/author_data_manger'
require_relative 'data_manger/book_data_manager'
require_relative 'data_manger/label_data_manager'

class App
  include GameDataManger
  include BookDataManager
  include LabelDataManager

  def initialize
    @games = GameDataManger.load_games
    @authors = AuthorDataManger.load_authors
    @books = BookDataManager.load_books
    @labels = LabelDataManager.load_labels
  end

  def save_data
    GameDataManger.save_game(@games)
    AuthorDataManger.save_author(@authors)
    BookDataManager.save_books(@books)
    LabelDataManager.save_labels(@labels)
  end

  def list_games
    @games.each { |game| puts "Multiplayer: #{game.multiplayer}, Last played at: #{game.last_played_at}" }
  end

  def list_authors
    @authors.each { |author| puts "Author first name: #{author.first_name}, Author last name: #{author.last_name}" }
  end

  def list_books
    @books.each do |book|
      puts "Book ID: #{book.id}, Publisher: #{book.publisher}, " \
           "Cover State: #{book.cover_state}, Archived: #{book.archived}"
    end
  end

  def list_labels
    @labels.each do |label|
      puts "Label ID: #{label.id}, Title: #{label.title}, Color: #{label.color}"
      label.items.each do |item|
        puts "  Item ID: #{item.id}, Publish Date: #{item.publish_date}, Publisher: #{item.publisher}, " \
             "Cover State: #{item.cover_state}, Archived: #{item.archived}"
      end
      puts '-' * 50
    end
  end

  def add_book
    print 'Enter publish date (YYYY-MM-DD): '
    publish_date = gets.chomp

    print 'Enter publisher: '
    publisher = gets.chomp

    print 'Enter cover state: '
    cover_state = gets.chomp

    book = Book.new(publish_date, publisher, cover_state)
    @books << book

    create_label(book)
    puts 'Book added successfully!'
  end

  def create_label(item)
    print 'Enter label title: '
    title = gets.chomp

    print 'Enter label color: '
    color = gets.chomp

    label = Label.new(title, color)
    label.add_item(item)
    @labels << label
  end

  def display_menu
    puts ' '
    puts '*' * 50
    puts "|\t\tWelcome to our App!\t\t|"
    puts '*' * 50
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all music albums'
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
      1 => -> { list_books },
      2 => -> { 'list_all_music_albums' },
      3 => -> { list_games },
      4 => -> { 'list_all_genres' },
      5 => -> { list_labels },
      6 => -> { list_authors },
      7 => -> { add_book },
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
