require './app'
def main
  app = App.new
  loop do
    app.display_menu
    app.process_option
  end
end

main
