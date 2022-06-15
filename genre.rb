class Genre
  attr_reader :name, :items

  def initialize(name)
    @id = Time.now.to_i
    @name = name
    @items = []
  end

  def add_item(item)
    return if @items.include?(item)

    @items << item
    item.genre = self
  end
end
