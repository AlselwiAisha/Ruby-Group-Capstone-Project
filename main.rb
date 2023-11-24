require './app'

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

def main
  app = App.new
  loop do
    display_menu
    app.process_option
  end
end

main
