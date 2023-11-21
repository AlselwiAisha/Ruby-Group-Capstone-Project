class App
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

  def process_option(option)
    options = {
      1 => -> { 'list_all_books' },
      2 => -> { 'list_all_music_albums' },
      3 => -> { 'list_all_games' },
      4 => -> { 'list_all_genres' },
      5 => -> { 'list_all_labels' },
      6 => -> { 'list_all_authors' },
      7 => -> { 'add_book' },
      8 => -> { 'add_music_album' },
      9 => -> { 'add_game' }
    }
    case option
    when 1, 2, 3, 4, 5, 6, 7, 8, 9
      options[option].call
    end
  end
end
