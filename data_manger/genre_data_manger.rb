require_relative '../lib/genre'
require 'json'

module GenreModule
  def self.load_genres
    if File.exist?('./data/genre.json')
      genres = JSON.parse(File.read('./data/genre.json')).map do |genre|
        Genre.new(genre['genre_name'])
      end
    else
      File.write('./data/genre.json', JSON.dump([]))
    end
    genres.any? ? genres : []
  end

  def self.save_genre(genres)
    if genres.any?
      File.write('./data/genre.json', JSON.dump(genres))
    else
      File.write('./data/genre.json', JSON.dump([]))
    end
  end
end
