

module MusicAlbumModule
    def create_music_album(publish_date, on_spotify)
      album = MusicAlbum.new(publish_date, on_spotify)
      @albums << album
    end
  
    def list_music_albums
      if @albums.empty?
        puts 'The music album is empty'
      else
        @albums.each_with_index do |album, i|
          puts "#{i + 1}) album on spotify?: #{album.on_spotify}, Publish Date: #{album.publish_date}"
        end
  
      end
    end
  end