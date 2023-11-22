require 'json'
require_relative '../lib/music_album'


class MusicManager
    DATA_FOLDER = 'json/'.freeze
  
    def obtain_music_album
      return [] unless File.exist?("#{DATA_FOLDER}music_album.json")
  
      data = JSON.parse(File.read("#{DATA_FOLDER}music_album.json"))
      music_albums = []
      data['Albums'].map do |music_album_data|
        music_albums << MusicAlbum.new(music_album_data['publish_date'], music_album_data['on_spotify'])
      end
      music_albums
    end
  
    def save_music_album(songs)
      File.open("#{DATA_FOLDER}/music_album.json", 'w') do |file|
        data = {
          'Albums' => songs.map do |song|
            {
              'on_spotify' => song.on_spotify,
              'publish_date' => song.publish_date
            }
          end
        }
        file.write(JSON.pretty_generate(data))
      end
    end
  end