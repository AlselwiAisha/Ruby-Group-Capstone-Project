

module GenreModule
    def list_genre
      if @genres.empty?
        puts 'Genre is empty at the momment'
      else
        @genres.each_with_index do |genre, i|
          puts "#{i + 1}) ID: #{genre.id}, Last name: #{genre.name}"
        end
      end
    end
  end