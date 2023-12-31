# app.rb
require_relative 'data_manger/game_data_manger'
require_relative 'data_manger/author_data_manger'
require_relative 'data_manger/book_data_manager'
require_relative 'data_manger/label_data_manager'
require_relative 'data_manger/genre_data_manger'
require_relative 'data_manger/musicalbum_data_manger'

class App
  include GameDataManger
  include BookDataManager
  include LabelDataManager
  include GenreModule
  include MusicAlbumModule

  def initialize
    @games = GameDataManger.load_games
    @authors = AuthorDataManger.load_authors
    @books = BookDataManager.load_books
    @labels = LabelDataManager.load_labels
    @genres = GenreModule.load_genres
    @albums = MusicAlbumModule.load_musics
  end

  def save_data
    GameDataManger.save_game(@games)
    AuthorDataManger.save_author(@authors)
    BookDataManager.save_books(@books)
    LabelDataManager.save_labels(@labels)
    GenreModule.save_genre(@genres)
    MusicAlbumModule.save_music(@albums)
  end

  def list_games
    puts 'List of Games:'
    @games.each do |game|
      puts "Pulish date:#{game.publish_date}, Multiplayer: #{game.multiplayer}, " \
           "Last played at: #{game.last_played_at}, Archived: #{game.archived}"
    end
  end

  def list_authors
    puts 'List of Authors:'
    @authors.each_with_index do |author, i|
      puts "#{i + 1} - Author name: #{author.first_name} #{author.last_name}" if author
    end
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
    print 'Enter book publish date (YYYY-MM-DD): '
    publish_date = gets.chomp

    print 'Enter publisher name: '
    publisher = gets.chomp

    print 'Enter book cover state (good / bad): '
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

  def list_musics
    puts 'List of Musics:'
    @albums.each { |album| puts "Is on spotify: #{album.on_spotify}, Publish Date: #{album.publish_date}" }
  end

  def list_genres
    puts 'List of Genres:'
    @genres.each_with_index do |genre, i|
      puts "#{i + 1} - Genre name: #{genre.name}" if genre
    end
  end

  def process_option
    option = gets.chomp.to_i
    options = {
      1 => -> { list_books },
      2 => -> { list_musics },
      3 => -> { list_games },
      4 => -> { list_genres },
      5 => -> { list_labels },
      6 => -> { list_authors },
      7 => -> { add_book },
      8 => -> { create_music },
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
