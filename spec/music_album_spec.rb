require_relative '../lib/music_album'

describe MusicAlbum do
  context 'test all class properties' do
    music = MusicAlbum.new('2015-06-23', on_spotify: true)
    it 'check if music is an instance' do
      expect(music).to be_an_instance_of MusicAlbum
    end

    it 'show inheritance from item class' do
      expect(music).to be_kind_of Item
    end

    it 'check if music can be moved to archive' do
      music.move_to_archive
      expect(music.archived).to eql(false)
    end
  end
end
