require 'date'
require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify == true
  end

  def to_json(*args)
    {
      'on_spotify' => @on_spotify,
      'publish_date' => @publish_date
    }.to_json(*args)
  end
end
