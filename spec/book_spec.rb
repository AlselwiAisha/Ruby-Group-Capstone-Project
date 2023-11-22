# book_spec.rb
require_relative '../lib/book'
require 'json'

RSpec.describe Book do
  let(:book) { Book.new('2022-01-01', 'Publisher', 'good') }

  describe '#initialize' do
    it 'sets publisher' do
      expect(book.publisher).to eq 'Publisher'
    end

    it 'sets cover_state' do
      expect(book.cover_state).to eq 'good'
    end
  end

  describe '#can_be_archived?' do
    it 'returns true when cover_state is bad' do
      bad_cover_book = Book.new('2021-01-01', 'Publisher', 'bad')
      expect(bad_cover_book.can_be_archived?).to be true
    end

    it 'returns true when super returns true' do
      archived_book = Book.new('2010-01-01', 'Publisher', 'good', archived: true)
      expect(archived_book.can_be_archived?).to be true
    end

    it 'returns false when cover_state is good and super returns false' do
      expect(book.can_be_archived?).to be false
    end
  end

  describe '#to_hash' do
    it 'generates a hash representation' do
      hash_data = book.to_hash

      expect(hash_data[:id]).to be_a(Integer)
      expect(hash_data[:publish_date]).to eq('2022-01-01')
      expect(hash_data[:archived]).to be false
      expect(hash_data[:label]).to be_an(Array) # Adjust this line
      expect(hash_data[:publisher]).to eq 'Publisher'
      expect(hash_data[:cover_state]).to eq 'good'
    end
  end
end
