require_relative 'item'
require 'date'
class Game < Item
  attr_accessor :publish_date, :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at, archived: false)
    super(publish_date, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at.is_a?(Time) ? last_played_at : DateTime.parse(last_played_at).to_time
    @archived = move_to_archive
  end

  def can_be_archived?
    super || (Time.now - @last_played_at) >= 2 * 365 * 24 * 60 * 60 # 2 years in seconds
  end

  def to_json(*args)
    {
      'publish_date' => @publish_date,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at,
      'archived' => @archived
    }.to_json(*args)
  end
end
