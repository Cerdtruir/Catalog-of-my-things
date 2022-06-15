require 'date'

class Item
  attr_reader :publish_date, :genre, :title, :archived

  def initialize(title, publish_date)
    @id = Time.now.to_i
    @title = title
    @publish_date = publish_date
  end

  def genre=(genre)
    @genre = genre
    genre.add_item(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    true if Date.today - @publish_date > 3650
  end
end
