require './app'
def main
  app = App.new
  loop do
    app.display_menu
    option = gets.to_i
    if option == '10'
      puts 'Thank you for using this app!'
      break
    end
    app.process_option(option)
  end
end

main
