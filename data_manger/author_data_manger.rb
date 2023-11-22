require_relative '../lib/author'
require 'json'

module AuthorDataManger
  def self.load_authors
    if File.exist?('./data/authors.json')
      authors = JSON.parse(File.read('./data/authors.json')).map do |author|
        Author.new(author['first_name'], author['last_name'])
      end
    else
      File.write('./data/authors.json', JSON.dump([]))
    end
    authors.any? ? authors : []
  end

  def self.save_author(authors)
    if authors.any?
      File.write('./data/authors.json', JSON.dump(authors))
    else
      File.write('./data/authors.json', JSON.dump([]))
    end
  end
end
