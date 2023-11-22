# book.rb
require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, publisher, cover_state, archived: false)
    super(publish_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == "bad"
  end

  def to_hash
    {
      id: @id,
      publish_date: @publish_date,
      archived: @archived,
      label: @label&.to_hash,
      publisher: @publisher,
      cover_state: @cover_state
    }
  end
end
