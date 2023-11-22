require_relative '../lib/genre'
require_relative '../lib/music_album'

describe Genre do
  context 'test class properties' do
    jazz = Genre.new('jazz')
    album = MusicAlbum.new('2000-12-06', false)
    jazz.add_item(album)
    it 'check if genre is an instance' do
      expect(jazz).to be_an_instance_of Genre
    end

    it 'confirm name of genre' do
      expect(jazz.name).to eql('jazz')
    end

    it 'add item (music album)' do
      expect(jazz.items).to include(album)
    end
  end
end
