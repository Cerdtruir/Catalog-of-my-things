require_relative 'item'

class Game < Item
  attr_reader :multiplayer, :last_played_at_date

  def initialize(title, publish_date, multiplayer, last_played_at_date)
    super(title, publish_date)
    @multiplayer = multiplayer
    @last_played_at_date = last_played_at_date
  end

  private

  def can_be_archived?
    true if super && Date.today - @last_played_at_date > 730
  end
end
