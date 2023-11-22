require 'json'
require_relative '../lib/genre'


class GenreData
    DATA_FOLDER = 'json/'.freeze
  
    def obtain_genre
      return [] unless File.exist?("#{DATA_FOLDER}genre.json")
  
      data = JSON.parse(File.read("#{DATA_FOLDER}genre.json"))
      genres = []
      data['Genres'].map { |genre_data| genres << Genre.new(genre_data['name']) }
      genres
    end
  end