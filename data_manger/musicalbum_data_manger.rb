require_relative '../lib/music_album'
require_relative '../lib/genre'
require 'json'
require 'date'

module MusicAlbumModule
  def create_music
    print 'Is it on spotify ? (yes/no): '
    on_spotify_input = gets.chomp.downcase
    on_spotify = on_spotify_input == 'yes'
    print 'Enter the last played date (YYYY-MM-DD):'
    date_input = gets.chomp

    begin
      publish_date = Date.parse(date_input).to_time
    rescue ArgumentError
      puts 'Invalid date format. Please use YYYY-MM-DD.'
      create_game
    end

    album = MusicAlbum.new(publish_date, on_spotify)
    @albums << album

    create_genre
  end

  def create_genre
    puts 'Enter Music Genre :'
    genre_name = gets.chomp
    genre = Genre.new(genre_name)
    @genres << genre
    puts 'Music-Album added successfully'
  end

  def self.load_musics
    if File.exist?('./data/music_album.json')
      musics = JSON.parse(File.read('./data/music_album.json')).map do |music|
        MusicAlbum.new(music['publish_date'], music['on_spotify'])
      end
    else
      File.write('./data/music_album.json', JSON.dump([]))
    end
    musics.any? ? musics : []
  end

  def self.save_music(musics)
    if musics.any?
      File.write('./data/music_album.json', JSON.dump(musics))
    else
      File.write('./data/music_album.json', JSON.dump([]))
    end
  end
end
