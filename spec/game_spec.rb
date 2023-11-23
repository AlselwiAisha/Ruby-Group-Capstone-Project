require './lib/game'
require 'json'
describe Game do
  let(:game) { Game.new('2021-01-01', true, '2021-11-11') }

  describe '#initialize' do
    it 'sets multiplayer' do
      game = Game.new('2021-01-01', true, Time.now)
      expect(game.multiplayer).to be true
    end

    it 'sets last_played_at' do
      time = Time.now
      game = Game.new('2021-01-01', true, time)
      expect(game.last_played_at).to eq(time)
    end
  end

  describe 'Testing Game' do
    it 'Testing multiplayer' do
      expect(game.multiplayer).to eq true
    end

    it 'Testing last played at' do
      expect(game.last_played_at).to eq '2021-11-11'
    end
  end
  describe '#can_be_archived?' do
    it 'returns true when last_played_at is older than 2 years' do
      two_years_ago = Time.now - (2 * 365 * 24 * 60 * 60)
      game = Game.new('2001-01-01', true, two_years_ago)
      expect(game.can_be_archived?).to be true
    end

    it 'returns false when last_played_at is within 2 years' do
      one_year_ago = Time.now - (365 * 24 * 60 * 60)
      game = Game.new('2021-01-01', true, one_year_ago)
      expect(game.can_be_archived?).to be false
    end

    it 'generates JSON representation' do
      json_data = game.to_json
      expect(json_data).to include('"publish_date":"2021-01-01"')
      expect(json_data).to include('"multiplayer":true')
      expect(json_data).to include('"last_played_at":"2021-11-11"')
    end
  end
end
