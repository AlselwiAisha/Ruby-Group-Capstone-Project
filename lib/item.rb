# item.rb

class Item
  attr_accessor :id, :publish_date, :archived, :genre, :source, :author, :label

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
    @genre = []
    @source = []
    @author = []
    @label = []
  end

  def can_be_archived?
    Time.now.year - Date.parse(@publish_date).year > 10
  end

  def move_to_archive
    @archived = can_be_archive?
  end
end
