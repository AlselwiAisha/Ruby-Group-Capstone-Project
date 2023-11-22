# book_data_manager.rb
require_relative '../lib/book'
require 'json'

module BookDataManager
  def self.load_books
    if File.exist?('./data/books.json')
      books = JSON.parse(File.read('./data/books.json')).map do |book|
        Book.new(book['publish_date'], book['publisher'], book['cover_state'], archived: book['archived'])
      end
    else
      File.write('./data/books.json', JSON.dump([]))
    end
    books.any? ? books : []
  end

  def self.save_books(books)
    if books.any?
      books_data = books.map(&:to_hash)
      File.write('./data/books.json', JSON.dump(books_data))
    else
      File.write('./data/books.json', JSON.dump([]))
    end
  end
end
